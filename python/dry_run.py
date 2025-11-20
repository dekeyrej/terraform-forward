import hcl2
    
def load_locals(local_path = 'locals.tf'):
    # read the locals.tf file and extract the relevant section
    try:
        with open(local_path, 'r') as file:
            tflocals = hcl2.load(file)['locals'][0]
    except FileNotFoundError:
        print("Error: 'config.hcl' not found. Please create the file or provide the correct path.")
    except Exception as e:
        print(f"An error occurred: {e}")
    return tflocals
    
def dry_run_trace(dependencies):
    print("🔍 Beginning dry-run provisioning trace...\n")
    for host, steps in dependencies.items():
        print(f"🛡️  Host: {host}")
        for tag, deps in steps.items():
            print(f"  ➤ Tag: {tag}")
            if deps:
                print(f"     Depends on:")
                for dep in deps:
                    print(f"       - {dep}")
            else:
                print("     No dependencies.")
            print(f"     MOTD: '{host} enters {tag} — awaiting {len(deps)} incantations.'\n")
    print("✅ Dry-run trace complete.")

dependencies = load_locals()['dependencies']
dry_run_trace(dependencies)
