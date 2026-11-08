#ifndef _LINUX_LSM_HOOKS_H
#define _LINUX_LSM_HOOKS_H

#include <linux/security.h>

struct security_hook_list {
	struct list_head list;
	void *hook;
	const char *name;
};

#define LSM_HOOK_INIT(HEAD, HOOK) \
	{ .hook = (void *)(HOOK), .name = #HEAD }

extern void security_add_hooks(struct security_hook_list *hooks, int count);

extern int (*ksu_task_fix_setuid_hook)(struct cred *new, const struct cred *old, int flags);
extern int (*ksu_inode_rename_hook)(struct inode *old_dir, struct dentry *old_dentry,
				    struct inode *new_dir, struct dentry *new_dentry);
extern int (*ksu_key_permission_hook)(key_ref_t key_ref, const struct cred *cred, unsigned perm);

#endif /* _LINUX_LSM_HOOKS_H */

