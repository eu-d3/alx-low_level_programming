#include "lists.h"

/**
 * delete_dnodeint_at_index - Deletes the node at a given index
 *
 * @head: Double pointer to the head of the double linked list.
 * @index: The index of the node to be deleted.
 *
 * Return: 1 (success), or -1 (failure)
 */
int delete_dnodeint_at_index(dlistint_t **head, unsigned int index)
{
	unsigned int count;
	dlistint_t *current;

	if (head == NULL)
		return (-1);

	current = *head;
	count = 0;

	if (index == 0)
	{
		if (current == NULL)
			return (-1);
		if (current->next != NULL)
			(current->next)->prev = NULL;
		*head = current->next;
		free(current);
		return (1);
	}


	while (current != NULL)
	{
		if (count == index)
			break;
		current = current->next;
		count++;
	}
	if (count != index)
		return (-1);

	(current->prev)->next = current->next;
	if (current->next != NULL)
		(current->next)->prev = current->prev;
	free(current);

	return (1);
}
