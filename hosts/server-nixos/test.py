import hashlib

def get_service_port(service_name):
    # Define a base port
    base_port = 50000
    # Generate a hash of the service name
    hash_object = hashlib.md5(service_name.encode())
    # Convert the hash to an integer and use modulo to fit within a 1000 range
    port_offset = int(hash_object.hexdigest(), 16) % 1000
    # Return the calculated port number
    return base_port + port_offset

def main():
    while True:
        service_name = input("Enter the service name (or type 'exit' to quit): ")
        if service_name.lower() == 'exit':
            break
        port = get_service_port(service_name)
        print(f"The port for service '{service_name}' is: {port}\n")

if __name__ == "__main__":
    main()

