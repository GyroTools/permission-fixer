# permissions-fixer

To check and fix the permissions of a volume:

check for read/write access: 

    docker run --rm --mount type=volume,source=volume_name,target=/test gyrotools/permissions-fixer /test uid gid rw

check for read only access: 

    docker run --rm --mount type=volume,source=volume_name,target=/test gyrotools/permissions-fixer /test uid gid r
