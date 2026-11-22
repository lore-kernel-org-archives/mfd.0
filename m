Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795338066;
	b=MxO8CtmCOXm+xY2UJg6sza3hBvzFM/1v27S1pSrAWX5Ofvkn+c1acnq7bhnrS+Rw4AY7
	 /ED2FGG2Ol29giTw3Q+4kgZ9waGoo9YS4h20kJebQrKmukGn1bPT8KuKZXnQtUG/0ZkEi
	 jffGjKpexXn/cylW5nQr5bIOpmAgh7LVJ7S9hzakyZtfRt6Ijhr40lobapkl17bK8ofNH
	 433k2p8gnCfDbON6Z9OQhyqfxMs3JsXp2ldVPnphZwMB1c64xfM6xbCZktMRjpJfAZb6w
	 c6G9kKuJroJQxial+cHZwmqx5oYfOMYBuRS23OCtra6hmdJKd0MNcZG9e1jCQjIywmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338066;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l5t4RAXcO7LRry3XVVZFdulyCmiEkHchMr2XOmtZokg=;
	b=hjW8HriXGYDYAOdkyJDrWspCkJYJIAFvG/jRFiaAMIjM7yfjzX6nnsh0C4Si3PhTmh3f
	 wL3nuxIZsiwwUaXpP/g4x+jCh3BUGUll7U/koXV9Zsv+jkqi1hDNol6IR3c1Qp3/j3y4x
	 mcpr5V8zgP3RiyHZIQbzlQkjV/wItnlbwBbqbReoV5mIW6V4te055auOwcK1XETjxiI9v
	 0nCXycRbHyHdOWHruEfLs/4Crkw+svQzdMwgK5JRiWIjqZOrWC5cniB8M6vhfnV+wPsQL
	 XWHYdeqw9SjiBjWngbzITksbFwD4yoNYALnbjH2suEZ0LPBtCPps2wUxZ1slDgUZ4iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5CXg0Kj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8CD606A32C;
	Sun, 22 Nov 2026 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5CXg0Kj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795338066;
	b=f4/ruAbGfADX/2/ch2hesigpkvGwPBA5sL71A+zbpcMrxfMv465GAz7CsH06RjhrbQ5v
	 YSymi+Hm/5SG3OFLYYgii3A4FqXLW8qddAUEhTX8r66yYM7Uuo9CGG0cDqA9XJFQPh7U7
	 HVLallE13I0qK+qXaQ6+zuTZbNYfB8Tludo5Mo1cvDt6/lmo+FmnsSCDKspWsRDIofXfC
	 /oNurMi2DBnDHfNMnwP6atkzQW7CtvDe5o7DVNDwhAQUMf0FCLN+GInRqNJRlG/RCFmS1
	 TDz6igraQ/yiTAnZ9SvtRigS72sRz1NwSAmRdfLi4JftgbHyCTZalRrg5m0qRieP8XQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795338066;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l5t4RAXcO7LRry3XVVZFdulyCmiEkHchMr2XOmtZokg=;
	b=abkcTeTspwc9hrQOXGJ/HHF7SCkPFlikPfpgQoZJIX4FOunewdH9BE6IdI2XI3cgvXao
	 Tu8i0Cu6be2cEdj0MQWFEBnERSYi7BMc7t5ZrFwlwW59jBrKcFY7k35SM3MYBKiBmKwgd
	 5cuaB1tPW4IhnvZDmrIFIEnCFM66wjbUHdCXBXYReuJL8LWlXC4yz/A65nuY2z/VYksZA
	 ienAE6t7YIEJZbgiYHTURxCtBgb3UvcPO/P4cj7e59HYUucCK1ZYRbirvY8PoqOWPyyCn
	 tBxnHBxTHjdLWJIX+A2M21Uz6dpqN3lZ7wDIBiozlBQYwzdaI03i1vSUOHjl4sC2fSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 814231F000C6;
	Sun, 22 Nov 2026 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795338066;
	bh=l5t4RAXcO7LRry3XVVZFdulyCmiEkHchMr2XOmtZokg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=m5CXg0KjkUY4ZZuvU5xGbLfwwaENopkaRvIWQDeg2E20+h4osHlAjWs+wCpyLyOrb
	 ueK+SmpZAY2UtbzOTbGJgH3p8PchV1Qa+tJZ2YOmb9ntmT9dEJBHaEuEDj1MGmbeR1
	 eGycy5PV5PUE+IkdntACOAR0uqpL4uq++1PdmvT6L+GYr48+DwIoluZhqXg6PEADLd
	 mOwoO7AKuDiLhf0NVNEOVd7qmXSgHtout6hTPLa0tHNCsFa4GHEfxfb08+HPznPynk
	 HOzdcJ+GBSdIC1e1OsRss44lquRmIkw1i2fGJtE4lUJHDV6naX6PAW3WMbiftnmwOi
	 5aqQI9S3S5KFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8C9E4BFBF;
	Sun, 22 Nov 2026 09:01:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 09:01:05 +0000
Subject: [PATCH v2] mfd: syscon: Give each syscon its own lockdep class
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-syscon-lockdep-v2-1-868056a6a808@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Q22rDMAyGXyX4eh6R7Rwpo+9RemEpSus1ibs4C
 Ssl774cOga7/ED6/096isC94yDK6Cl6nlxwvltAvUWCrra7sHTVwkLFKgWARIZHIN/JxtOt4ru
 sQOsak5wUsliW7j3X7nsLPJ13DiN+Mg1rymui569xaRr2MdFyCHZrKqPDq6j4LaLmJkdbywkky
 IqMNQTIOtHHS2td806+/Vhj0QaWC7RuKCMgzFSaY5rqnAxATVrVOtNcpAljjrbgAhUasSpeXRh
 8/9heMMFmtEuo+P+1m4TlKssKG8cG8z8JcZ7n+QcGrh23TwEAAA==
X-Change-ID: 20261115-syscon-lockdep-d133fb58c2be
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795338064; l=4034;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=891oUdhj4DaGdagCnYKDL4s/TeHvsuAZqehCwJn+lk0=;
 b=20u1VWFtJ9IxfpiChtYKMa2hCcY2YOfQVM7WdqvVfAw9aTT+ndMiIRLUGz4AHmbeV6uIYswCC
 c1oDlzufNhRAD0TlZyZGQBCap4B/Oq09srlpCeGsCy0zJ8yTPu/uQPh
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

All syscon regmaps share one lockdep class, as regmap_init_mmio() uses a
static key per call site. Lockdep then mixes up unrelated syscons: on
RK3588 the clock-gated VO1 GRF calls clk_enable() under its regmap lock,
while the CRU's GRF gates take the SYS GRF regmap lock under enable_lock.
This is reported as a circular dependency and disables lockdep.

Lock each syscon regmap with its own spinlock and lockdep class.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Tested on an Orange Pi 5 (RK3588S) with a 7.3 based kernel that has
out-of-tree DisplayPort patches, lockdep and KASAN on. Without the patch
lockdep reports the cycle during boot. With it /proc/lockdep shows one
syscon lock -> enable_lock and enable_lock -> another syscon lock, there
is no report and lockdep stays on. Build-tested on for-mfd-next.

Applies on top of "mfd: syscon: Put the clock after regmap_exit()":
https://lore.kernel.org/r/20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com

Developed with Claude (Anthropic), which wrote the code and the commit
message. I reviewed every change.
---
Changes in v2:
- __acquires/__releases: name the argument, not a local (Sashiko).
- Link to v1: https://patch.msgid.link/20261120-syscon-lockdep-v1-1-aed779a004b8@gmail.com
---
 drivers/mfd/syscon.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 3ff4e024542b..480ac178968a 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
 #include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -20,6 +21,7 @@
 #include <linux/reset.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 
 static DEFINE_MUTEX(syscon_list_lock);
 static LIST_HEAD(syscon_list);
@@ -29,8 +31,29 @@ struct syscon {
 	struct regmap *regmap;
 	struct reset_control *reset;
 	struct list_head list;
+	spinlock_t lock;
+	unsigned long lock_flags;
+	struct lock_class_key lock_key;
 };
 
+static void syscon_lock(void *arg)
+__acquires(&((struct syscon *)arg)->lock)
+{
+	struct syscon *syscon = arg;
+	unsigned long flags;
+
+	spin_lock_irqsave(&syscon->lock, flags);
+	syscon->lock_flags = flags;
+}
+
+static void syscon_unlock(void *arg)
+__releases(&((struct syscon *)arg)->lock)
+{
+	struct syscon *syscon = arg;
+
+	spin_unlock_irqrestore(&syscon->lock, syscon->lock_flags);
+}
+
 static const struct regmap_config syscon_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -114,12 +137,21 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	if (!syscon_config.max_register)
 		syscon_config.max_register_is_0 = true;
 
+	lockdep_register_key(&syscon->lock_key);
+	spin_lock_init(&syscon->lock);
+	lockdep_set_class(&syscon->lock, &syscon->lock_key);
+	if (!syscon_config.use_hwlock) {
+		syscon_config.lock = syscon_lock;
+		syscon_config.unlock = syscon_unlock;
+		syscon_config.lock_arg = syscon;
+	}
+
 	regmap = regmap_init_mmio(NULL, base, &syscon_config);
 	kfree(syscon_config.name);
 	if (IS_ERR(regmap)) {
 		pr_err("regmap init failed\n");
 		ret = PTR_ERR(regmap);
-		goto err_regmap;
+		goto err_key;
 	}
 
 	if (check_res) {
@@ -159,6 +191,8 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
 	regmap_exit(regmap);
 	if (!IS_ERR(clk))
 		clk_put(clk);
+err_key:
+	lockdep_unregister_key(&syscon->lock_key);
 err_regmap:
 	iounmap(base);
 	return ERR_PTR(ret);

---
base-commit: 1cb7268b6638c411fc32f373e965eb8ba9e9b2b4
change-id: 20261115-syscon-lockdep-d133fb58c2be
prerequisite-message-id: <20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com>
prerequisite-patch-id: 7cf33abeabb3eeaf1ba8ac6c461726fca87702cd

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


