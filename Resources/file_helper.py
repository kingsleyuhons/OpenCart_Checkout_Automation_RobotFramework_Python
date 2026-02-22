import  os
def get_upload_file_path():
    """
    Returns absolute path of file to upload
    """
    base_dir = os.path.dirname(__file__)
    file_path = os.path.join(base_dir, 'test_upload.png')
    return file_path