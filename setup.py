from setuptools import setup, find_packages
from os import path

here = path.abspath(path.dirname(__file__))

setup(
    name='py_bash',
    version='0.1.0',
    description="Simplify the use of Bash/Shell commands in Python",
    url='https://github.com/themarkrogers/py_bash',
    author='Mark Rogers',
    author_email='github@titanminds.com',
    license='GNU GPLv3 Affero',
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'Topic :: Software Development :: Development Tools',
        'License :: OSI Approved :: GPLv3a',
        'Programming Language :: Python :: 3.12',
        'Programming Language :: Python :: 3.13',
        'Programming Language :: Python :: 3.14',
    ],
    keywords='bash shell',
    packages=find_packages(exclude=['contrib', 'docs', 'test*']),
    install_requires=[],
    extras_require={
        'dev': ['check-manifest'],
        'test': ['coverage'],
    },
)
