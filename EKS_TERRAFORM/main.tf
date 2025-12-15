resource "aws_eks_cluster" "my_cluster_1" {
  name     = "my_cluster_1"
  role_arn = "arn:aws:iam::051674313766:role/Admin1"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-0a5f853c77bc865ee","subnet-02ce0ab899c5ebb58"]  # Replace with your subnet IDs
    security_group_ids = ["sg-072dda41d69bb9c27"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster_1.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::051674313766:role/Admin1"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-0a5f853c77bc865ee","subnet-02ce0ab899c5ebb58"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
