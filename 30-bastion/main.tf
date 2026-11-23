resource "aws_instance" "bastion" {
  ami                    = local.ami
  instance_type          = "t3.micro"
  subnet_id              = local.public_subnet_id
  vpc_security_group_ids = [local.sg_bastion_id]
  iam_instance_profile   = aws_iam_instance_profile.bastion_profile.name

  user_data = templatefile("${path.module}/bastion.sh.tftpl", {
    partition_number = 4
    extra_disk_size  = 25
  })

  # Optional: Force instance replacement if the user_data script changes
  user_data_replace_on_change = true

  root_block_device {
    volume_size           = 50    # Size in GiB
    volume_type           = "gp3" # Recommended default
    delete_on_termination = true

    tags = local.common_tags
  }


  tags = local.common_tags
}