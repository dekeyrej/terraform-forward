import json
from jinja2 import Environment, FileSystemLoader
import hcl2

debug = False

class ansible_playbook_resource_builder:
    def __init__(self, local_files = ['locals.tf', 'locals_vis.tf', 'locals_playbooks.tf', 'locals_images.tf', 'locals_dependencies.tf']):
        self.local_files = local_files
        self.tflocals = self.load_locals()
        self.tranche = self.tflocals['tranche']
        self.template = self.create_template()
    
    def load_locals(self):
        # read the locals.tf file and extract the relevant section
        tflocals = {}
        for local_file in self.local_files:
            try:
                with open(local_file, 'r') as file:
                    tflocals |= hcl2.load(file)['locals'][0]
            except FileNotFoundError:
                print("Error: 'config.hcl' not found. Please create the file or provide the correct path.")
            except Exception as e:
                print(f"An error occurred: {e}")
        return tflocals
    
    def create_template(self, template_path = 'templates/ansible_playbook.tf.j2'):
        # create a Jinja2 environment and load the template
        env = Environment(loader=FileSystemLoader('.'))
        template = env.get_template(template_path)
        return template

    def build_playbook_context(self, host, tag = None):
        # calculate values for the template context
        playbook = self.tflocals['vis'].get(host, {}).get('playbook')
        if not playbook:
            raise ValueError(f"No playbook found for host: {host} — the provisioning scroll is incomplete.")
        playbook_path = f"{self.tflocals['playbooks'][playbook]['path']}"
        tags = self.tflocals['playbooks'][playbook]['playbook_tags']
        if len(tags) == 0 or tag is None:
            context = {
                'name': host,
                'dependencies': self.tflocals['dependencies'][host],
                'groups': json.dumps(self.tflocals['vis'][host]['groups']),
                'playbook_name': f"{host}-{playbook}",
                'playbook_path': playbook_path,
                'tranche': self.tranche,
                'steps': 0
            }
        else:
            context = {
                'name': host,
                'tag': tag,
                'dependencies': self.tflocals['dependencies'].get(host, {}).get(tag, []),
                'groups': json.dumps(self.tflocals['vis'][host]['groups']),
                'playbook_name': f"{host}-{playbook}-{tags.index(tag) + 1}-of-{len(tags)}",
                'playbook_path': playbook_path,
                'tranche': self.tranche,
                'steps': len(tags)   
            }
        return context
    
    def render_template(self, context):
        rendered_template = self.template.render(context)
        print(f"Rendered template for {context['playbook_name']}")
        return rendered_template
    
    def build_playbooks(self):
        playbooks = []
        for host in self.tflocals['vis']:
            if len(self.tflocals['vis'][host]['host_tags']) > 0:
                for tag in self.tflocals['vis'][host]['host_tags']:
                    context = self.build_playbook_context(host, tag)
                    rendered_template = self.render_template(context)
                    playbooks.append(rendered_template)
            else:
                context = self.build_playbook_context(host)
                rendered_template = self.render_template(context)
                playbooks.append(rendered_template)
        return playbooks

if __name__ == "__main__":
    builder = ansible_playbook_resource_builder()
    playbooks = builder.build_playbooks()
    with open('ansible_playbooks.tf', 'w') as file:
        file.write('\n'.join(playbooks))
    print("Ansible playbooks have been generated and written to 'ansible_playbooks.tf'.")
    # for host in builder.tflocals['vis']:
    #     if len(builder.tflocals['vis'][host]['host_tags']) > 0:
    #         for tag in builder.tflocals['vis'][host]['host_tags']:
    #             context = builder.build_playbook_context(host, tag)
    #             if debug:
    #                 print(json.dumps(context, indent=2))
    #             else:
    #                 rendered_template = builder.render_template(context)
    #                 print(rendered_template)
    #     else:
    #         context = builder.build_playbook_context(host)
    #         if debug:
    #             print(json.dumps(context, indent=2))
    #         else:
    #             rendered_template = builder.render_template(context)
    #             print(rendered_template)
