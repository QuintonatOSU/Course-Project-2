cd terraform
echo "Destroying AWS infrastructure..."
terraform destroy -auto-approve
cd ..
echo "Cleanup complete. Thank you for taking the time to run my project!"