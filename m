Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301755;
	b=WHVSGxdDdcE89H4vC5HL1u2WTePbXdxgShvON8XdBYHNn5Usu8rNs1j7tVJfsaPQPfiS
	 XtjHnXAcoya1V9lXqvTbHsH2wjcqRNRjmyj4bNUsRYvu5mM4dTz7gqdK5JuO0GiJ2loN9
	 aJSEyqEv0OQGnY3KUTnDAx2KzR1sGXeP8XY7tXLqLZvYOjF3306tqXyVmirgvgFZ2qFf/
	 oXsmzcLyee01TFOiucDTh7V+42M6viiHbbo1b9K6OdItqvF6+ntodMkzc8Xp9MjZNNnp/
	 1uabQqSyTyI7Pa6QAHwQincY/Ym6guTKjlFlG9tYr4jLsDTBLzUg36NcwyHO5RWuw4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VgMjaAdSUBWGVIhVnRrz2pW+hkBebWKAoToCNEDeRGY=;
	b=EgKs4Y92LqY8WvIb3CeDtmn3VwskEU5CLX84dj9zgxzX4UGFgFJpU84r3Z74GU9YQoDY
	 xce9uswydnOk5GA6Qqdz7TVtBR9MG9HQWFaAV4JQtpmAmbwL/1ZffAzBW16VJMcuZJQle
	 6jmKGbAQzhP8liEbgPWEfmWeGxYDGCAfB8w1rFkIVIszIxjvkaJyZcuusziTXIB6CWAAY
	 WGaeMaoiLqLtyTPR9R95LJm5e5VkAA8tcmFD+U8usqRbqO/4sJ68s2dpJk95tcE40cOkB
	 FwlR56//NYUAbVFWympLpfD1aOLRaR1EQX4zOBjyRyCDQSNX/JELSet+0yTkRZS05rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zc8LSwka;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AF4606A31E
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 19:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AF4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zc8LSwka
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso19883795e9.2
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793301753; x=1793906553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgMjaAdSUBWGVIhVnRrz2pW+hkBebWKAoToCNEDeRGY=;
        b=Zc8LSwkaUFL4oQIbzTwRpPLnOrcAF3WdEFMJr6vseq4yvtwtpp+4Vci/Xu62E+UicM
         VE9v+6H6IOpezP43IiId9BoGv6hlhOz3dT1RsTOkxR0uleihSBkb7YjvhangJOtVI8U3
         9WteoVCfBZDPGzwGbSBlpYt76rajPFHhqKljr6KrVIRlRQJFadClDKp7rWLiAqTMJXun
         9NbZvhsbgyw4J1EXIYyMSbXkvaYTUTZJV3NZma3gZuQWqgxvNf4RqEctDGo06PmASxFF
         AZC9WGy3eSZNqjA3lf94QJlm7YTdJq40y27BiDtjVQSmzMOcBOAYk2zEmXcHRWZBYAgD
         dCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301753; x=1793906553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgMjaAdSUBWGVIhVnRrz2pW+hkBebWKAoToCNEDeRGY=;
        b=eWBgKLv2/Y36C01i/z8x4FrtznuElnbF0t+BzzeXqxDIopkPPY7HS/xpfX2ub+KjQw
         X14OUi32n+o6lVXG6Jm+5zio4ypPaX8iq4q2dmUTSV8Z3pQtPVueCBDiH0k1xGRx0tRs
         vJTiB0cfuPouxtt25e9GSd/jRnmBLm2moftaJwRmUT8jhDfRUs382GRRJ/WNFdV8NH82
         0AypJ9fZ80oWCx3I9WVU0nPBCUq7s3YR4r+CDTIEEgviO69rStLaKtqRemDdXz5Wmr1W
         GsB7P7ICmxvK307O8myCCrzVbzGG3tcMq9nXppWsRd2FYvLyIB5qs8lup37J6XerdQsH
         XAFg==
X-Gm-Message-State: AFq9FYIJ2y3eAz+HOT2p2OeBBL5Wd89DHRyJ4PwoGAKABeA0yqhEDWK3
	CTupgwikOETZ8YxeVn9uW6iPn9jYpJ/ldT6zCAcSpQyurP8K/oGYvxLw
X-Gm-Gg: AYBFou2G3ogdi5wthL8xcipmQzn19VBJpMBB0jh+YY4Upsj7MCPxEEH7cReLuM0DrWD
	3amaJq9RU23D3Ec14hO7wc5xByIqk7HbJ2pUe81+98IFHGwM8ajPCwP3A6rqGewdKWmoFtMJdKe
	KxpQnKpIgMzT6fYYZtIR5HFohgw7SzbEwMSnPi+8VMxBEUG8s9ltYQbZcJ5w3byih+ZkkRtAae9
	0dBOrjmLUxoxxQu/UMXsyFP+DqBGz4mIpzSYXS9KvaYOZYNLZVacoUgJNBrlWkuRmDEveNOdpqH
	XNLX5PIhIa6z9nSaKT9PiM8N4e0QBt1e4pGOFPFy02hCKlDUjIGhew5B2vPuhhETgD5fNgWrQ1Y
	GMyG+rki4Dr2jtU7TYaA+xA0Gtg809y2271Mst0YVV06xh5bLgFTJl6fXfGq2eUdJVK7jxcMQtr
	BhpkrgAuin7a7TIepY8uKOOTefHtAXnQoP5LwJRuX7AdrO/xANtQvpW0gI+BRcbYFLNaXCdrKHj
	M0Ix5MMet7J4kCP/LK83G8sObMfY4ujdOwiC0oOOibmSyIIlRyiNdU1rHVK0uW0/CaAdnJiPlgv
	1dA98EVN5sVEb2zVUpUgtQ==
X-Received: by 2002:a05:600c:8116:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4a9678c3c97mr136610125e9.33.1793301752998;
        Thu, 29 Oct 2026 12:22:32 -0700 (PDT)
Received: from fedora ([194.36.27.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eba2d89sm293740f8f.57.2026.10.29.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:22:32 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: lee@kernel.org,
	ejona86@gmail.com
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical section
Date: Thu, 29 Oct 2026 22:22:23 +0300
Message-ID: <20261029192223.462367-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPI does not support atomic transfers, so it's dangerous to call from
atomic notif chains, since it can cause stall during reboot on
orangepi5 (see trace below).

Commit 128115b520c6 ("mfd: rk8xx: Register poweroff handler in atomic phase")
moved shutdown methods to atomic notif chain, since i2c transfer didn't
work during PREPARE step. I don't have an access to rk3288 based boards and
patch reasoning is not completely clear.

That's why this patch hacks notifier registration only for SPI based
PMICs.

66.145226] reboot: Power down
[  266.145581] ------------[ cut here ]------------
[  266.145986] Voluntary context switch within RCU read-side critical section!
[  266.146007] WARNING: kernel/rcu/tree_plugin.h:330 at rcu_note_context_switch+0x3dc/0x5d8, CPU#0: systemd-shutdow/1
[  266.147525] Modules linked in:
[  266.147800] CPU: 0 UID: 0 PID: 1 Comm: systemd-shutdow Not tainted 7.3.0-opi5-test+ #2 PREEMPT
[  266.148560] Hardware name: Xunlong Orange Pi 5 (DT)
[  266.148987] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  266.149596] pc : rcu_note_context_switch+0x3dc/0x5d8
[  266.150034] lr : rcu_note_context_switch+0x3dc/0x5d8
[  266.150472] sp : ffff80008005b4e0
[  266.150764] x29: ffff80008005b4e0 x28: ffff000100903000 x27: ffffc7018d616000
[  266.151393] x26: 0000c4fe4deb68c0 x25: ffffc7018d639260 x24: 0000000000000000
[  266.152021] x23: ffff000100903000 x22: ffff0002fee4ef80 x21: ffffc7018d616f80
[  266.152649] x20: 0000000000000000 x19: ffff000100903000 x18: 0000000000000000
[  266.153277] x17: ffff80008005b8b8 x16: 0000000000000000 x15: 0000000000000000
[  266.153904] x14: 0000000000000a37 x13: ffffc7018d82a478 x12: ffff390171838000
[  266.154532] x11: ffff0002fee3a198 x10: 0000000000000001 x9 : ffffc7018d6642d0
[  266.155161] x8 : 0000000100000001 x7 : 0000000000000000 x6 : 7261746e756c6f56
[  266.155789] x5 : ffffc7018d93e807 x4 : ffffc7018cd48369 x3 : ffff80008005b058
[  266.156416] x2 : 00000000000002a8 x1 : 0000000000000001 x0 : 000000000000003f
[  266.157044] Call trace:
[  266.157262]  rcu_note_context_switch+0x3dc/0x5d8 (P)
[  266.157703]  __schedule+0x80/0x1540
[  266.158015]  schedule+0x5c/0xe0
[  266.158296]  schedule_timeout+0x7c/0xe8
[  266.158636]  wait_for_common+0xbc/0x188
[  266.158977]  wait_for_completion_timeout+0x1c/0x30
[  266.159401]  spi_transfer_one_message+0x2c0/0x838
[  266.159819]  __spi_pump_transfer_message+0x1f0/0x448
[  266.160258]  __spi_sync+0x224/0x450
[  266.160569]  spi_write_then_read+0x134/0x1b8
[  266.160947]  rk806_spi_bus_read+0x4c/0x70
[  266.161304]  _regmap_raw_read+0x1a0/0x368
[  266.161661]  _regmap_bus_read+0x48/0x88
[  266.162001]  _regmap_read+0x17c/0x260
[  266.162326]  _regmap_update_bits+0x7c/0x138
[  266.162696]  regmap_update_bits_base+0x6c/0xa8
[  266.163089]  rk808_power_off+0xec/0x120
[  266.163429]  sys_off_notify+0x34/0x50
[  266.163756]  atomic_notifier_call_chain+0x78/0x170
[  266.164178]  do_kernel_power_off+0xf0/0x170
[  266.164549]  machine_power_off+0x20/0x38
[  266.164900]  kernel_power_off+0xf4/0x110
[  266.165248]  __arm64_sys_reboot+0x27c/0x290
[  266.165619]  invoke_syscall+0x4c/0xf8
[  266.165944]  el0_svc_common+0x94/0xe8
[  266.166268]  do_el0_svc+0x24/0x38
[  266.166562]  el0_svc+0x34/0x90
[  266.166833]  el0t_64_sync_handler+0x68/0xe0
[  266.167203]  el0t_64_sync+0x17c/0x180
[  266.167528] ---[ end trace 0000000000000000 ]---

CC: Eric Anderson <ejona86@gmail.com>
Fixes: 128115b520c6 ("mfd: rk8xx: Register poweroff handler in atomic phase")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Hey Eric!

I don't have rk3288 board to test. However, I strongly suspect that
patch does not affect your case.

I've tried to track down root cause of i2c hung, but no luck. Based on
FDT i2c is directly connected to GIC, so IRQs must be enabled during
PREPARE step.

Would be great if you test that patch.

---
 drivers/mfd/rk8xx-core.c  | 19 ++++++++++++++++---
 drivers/mfd/rk8xx-i2c.c   |  2 +-
 drivers/mfd/rk8xx-spi.c   |  2 +-
 include/linux/mfd/rk808.h |  2 +-
 4 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 21182df45d1b..c4c5907c9fcd 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -761,7 +761,7 @@ void rk8xx_shutdown(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(rk8xx_shutdown);
 
-int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap)
+int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap, bool spi)
 {
 	struct rk808 *rk808;
 	const struct rk808_reg_data *pre_init_reg;
@@ -874,8 +874,21 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 
 	if (device_property_read_bool(dev, "system-power-controller") ||
 	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+		/* There is no support for atomic SPI transfers (yet?). Thus it's not possible to
+		 * perform SPI i/o during atomic notify handler.
+		 *
+		 * Patch 128115b520c6 claims that i2c does not work during _PREPARE state, so be
+		 * extra careful while changing modes here.
+		 */
+		enum sys_off_mode off_mode =
+			spi ? SYS_OFF_MODE_POWER_OFF_PREPARE :
+			      SYS_OFF_MODE_POWER_OFF;
+		enum sys_off_mode restart_mode =
+			spi ? SYS_OFF_MODE_RESTART_PREPARE :
+			      SYS_OFF_MODE_RESTART;
+
 		ret = devm_register_sys_off_handler(dev,
-				    SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_HIGH,
+				    off_mode, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
 		if (ret)
 			return dev_err_probe(dev, ret,
@@ -885,7 +898,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 		case RK809_ID:
 		case RK817_ID:
 			ret = devm_register_sys_off_handler(dev,
-							    SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
+							    restart_mode, SYS_OFF_PRIO_HIGH,
 							    &rk808_restart, rk808);
 			if (ret)
 				dev_warn(dev, "failed to register rst handler, %d\n", ret);
diff --git a/drivers/mfd/rk8xx-i2c.c b/drivers/mfd/rk8xx-i2c.c
index 161b25fbe146..f6e137ba394f 100644
--- a/drivers/mfd/rk8xx-i2c.c
+++ b/drivers/mfd/rk8xx-i2c.c
@@ -243,7 +243,7 @@ static int rk8xx_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(regmap),
 				     "regmap initialization failed\n");
 
-	return rk8xx_probe(&client->dev, data->variant, client->irq, regmap);
+	return rk8xx_probe(&client->dev, data->variant, client->irq, regmap, false);
 }
 
 static void rk8xx_i2c_shutdown(struct i2c_client *client)
diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
index bb85fe60518f..fba4b0582c8b 100644
--- a/drivers/mfd/rk8xx-spi.c
+++ b/drivers/mfd/rk8xx-spi.c
@@ -94,7 +94,7 @@ static int rk8xx_spi_probe(struct spi_device *spi)
 		return dev_err_probe(&spi->dev, PTR_ERR(regmap),
 				     "Failed to init regmap\n");
 
-	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap);
+	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap, true);
 }
 
 static const struct of_device_id rk8xx_spi_of_match[] = {
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904c864c..c55aa2effd18 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1469,7 +1469,7 @@ struct rk808 {
 };
 
 void rk8xx_shutdown(struct device *dev);
-int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap);
+int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap, bool spi);
 int rk8xx_suspend(struct device *dev);
 int rk8xx_resume(struct device *dev);
 
-- 
2.55.0

