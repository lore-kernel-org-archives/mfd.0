Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3A9439004
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509442; cv=none; b=k+Qhdj80qjP29n58ZIfjSCksYhXYYAntSkureHoJJe7yPEIIuWHMQzed9iATEZ1/WIiKnGGYu6XZC+YsYXcr0+AJKd/HMofDg+ktsXZc2FTNxGn334nFXbGyg6a16MOu0dZLbGTSaaaJfYaxe6vHk0I/2CjlgBzKQKF52NNukls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509442; c=relaxed/simple;
	bh=bwQ4trlC//Zb/ysrr6TEqa0K36yYnlKZDlcMALAt9eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rq8sE28Uwl09MOyyfoVbjpddN0AzGASorg8ON/VO2l+IlWsqRrQq81Dgs/IV7lcTenlNQyeNS7KtwcPR3S04C7xl5IjkmYKcJnIX1dPhWopAARUYZ1KlNso+Usb7REfSLZzpb7HJvKi7F/1ILWRHRBuQnuQJx1bOmKl10ZT8w38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X0Eyy659; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X0Eyy659"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b27c7451so19095795e9.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509436; x=1784114236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZRNsR/s0rCxhsVLSAGiCibpnPBQio1HUVuPZ2XkO64=;
        b=X0Eyy659H//WO9lpHYv6j3M2Qk6SIaQpHgkeivtE94IxVusNXeXmYS5mhXPGP/V9TJ
         SBsoDC00PC44jgVelTs+9chDQ31rhFggELBlxqyCTsm3mIGDMBu9xWZjWm9KXBY25HeU
         z244ZaQYEL1SS4slUK88CuOx6dZnMIAPMLS2dxOnmsXysIcRwEg+aMbhT4CbKe1BbdS7
         xdASIdODUp/KBM+5V51qkMEnxNDby0/W7NJaBS7QYKhgJNtEGrVSqlSspW6MsWU4IfJh
         9NmpHPpA1r/b2YvPBNaxZWsJSkoMiWmozbYiU2GkkPSw1fnu3IjA+1q6BTTQFP9CMe77
         gtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509436; x=1784114236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZRNsR/s0rCxhsVLSAGiCibpnPBQio1HUVuPZ2XkO64=;
        b=c+HwDt3RYinTHpSMthjGXn6NPpPjdAUA71NpRHRpSsJZnyuNp+/wJm94+TWTZTmmTW
         yv0xBbd80Q5vz6GNil/PlDxdyuG8OgWU52XBlCHM5gOC2T00FOhcRei4AoQj0ltf24u6
         1OBA3ew7E9KFXYz+cHpoR/q/ncl5r5j26FwE9cK636CfE+Lo+shUxmXxtV3svi6A8nSv
         Zkk5yQ5aMJESYFP2vYq2cC6FFbkpH0mBI6flwARF/OrweAQFhjvIHRRGGPvd89m9YBIT
         zdzhTtv9UAmlxpQplEniJHopT1T5PVpSnI2iZKpDU1cHGqUBI7+Zc6Xr/3BIZGEuCh5E
         RKfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDOq5Z0M4aNcNe/+BTNbPg+JoxKdp2BNERp0fQFnvkE77q0/H4pJabctSQttEN3re5lZM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlQhb04jXzCc88Pr8HhOK15IevyrjMKcg4bhgUTzr7rhbxsCG2
	EtHVpjqp0I1ihAtFWLjiiPN0prooJSYAaYdabSssE88rPi0XW5bvOmmr4kCGkwD2kNc=
X-Gm-Gg: AfdE7ck364X5ArGhco0O+Dece9xEZrf5PfHBHmqrnOtqfKto6Yq/cf/RYDAWcAr7Hru
	1U2tfWes+sO6/PtpPW5rcV8mWUjwHMIV6MDVK90+F+uXgULG+Dsx+MS6GmixAtjhBdke8R/YLTW
	3XMJ3mLqHe30/L9Ajd9A2qGAb8Z2wnEoivMblQFfPRlvbW1mN9I5t0QSHauomLMtbM+yDV6XJZc
	TsL/r+Qk2FYtDhG8Z8yt3MHK6pOu3xCHTu5BOB6GelQzM493OyB8Au54MiVODWXA4DadFj1vjYY
	aPnSoTGVmO7gmZwWOWl3TF5qwytpaG4GkUeQaCeOoO0DZt0K+QlFnAOvMWRo4+kMfWs0kGZQVgD
	KJMa+YPI34q1hav3RRcNk5Yd8mdaSBw2nMDU4NMh05efe58bmUR0IBCLeW8FtLWxc9uFxIalmVh
	EWl5HikV2kCvGdQr4rWrvIn4z+irkM2gtNqIg+DY2qE1ekB1YZTNqSSRxARZRzhjpwtzykmJRqZ
	TDm
X-Received: by 2002:a05:600c:4445:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493e63a50c1mr20945435e9.17.1783509436094;
        Wed, 08 Jul 2026 04:17:16 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e580cc6asm45839205e9.1.2026.07.08.04.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/23] mfd: Unify style of pci_device_id arrays
Date: Wed,  8 Jul 2026 13:15:29 +0200
Message-ID:  <3a662f20d0cd9b18a9de0457c437d7168fb9ce49.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5241; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bwQ4trlC//Zb/ysrr6TEqa0K36yYnlKZDlcMALAt9eg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjGJ+L8UJ8hD7vygcaN777f5BKUQauPpy6bfr sMutUqBQLuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xiQAKCRCPgPtYfRL+ TiTWB/4k9mlfB+ZG4uFzXMtKRmutLgrFt1MHRxtnSY640KsftT3ygM+ir51KELMJzNoDO9/72yh bE9+jZn/S6jTgW/Nt1vmfbPTjcWTnWgYg4sLfeu2KEAhi+zXhQQU2i742/+v+UngkgrL6ZvJ4UD rVF8mu0pvUteu2ccVRXpf/Ymmyh6NPzJvBeLoZCrMXNbviGlFqkHTF8yYAXMVXjSNQvQ66Mc6L/ 1uKCGaz1/wlnrBbnJbrRcfENHCGFCtDrzehxflJdeJCb3S/7CsPbKMe3Ae0XcviSdxaduKqtZkf yAZmoi3qifjer+b/onOD1NLVWiiBw5BbZDIbgB4ono7umRI8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cs5535-mfd.c           | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 4 ++--
 drivers/mfd/ioc3.c                 | 2 +-
 drivers/mfd/janz-cmodio.c          | 2 +-
 drivers/mfd/lpc_ich.c              | 2 +-
 drivers/mfd/rdc321x-southbridge.c  | 2 +-
 drivers/mfd/sm501.c                | 2 +-
 drivers/mfd/timberdale.c           | 2 +-
 drivers/mfd/vx855.c                | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
index f3becbef19f5..3b52717aa316 100644
--- a/drivers/mfd/cs5535-mfd.c
+++ b/drivers/mfd/cs5535-mfd.c
@@ -155,7 +155,7 @@ static void cs5535_mfd_remove(struct pci_dev *pdev)
 static const struct pci_device_id cs5535_mfd_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_CS5535_ISA) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CS5536_ISA) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, cs5535_mfd_pci_tbl);
 
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 87dbe1a94247..8e10b1c7c128 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -153,8 +153,8 @@ static struct mfd_cell intel_quark_mfd_cells[] = {
 };
 
 static const struct pci_device_id intel_quark_mfd_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x0934), },
-	{},
+	{ PCI_VDEVICE(INTEL, 0x0934) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, intel_quark_mfd_ids);
 
diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index bf2be3bc8602..b78dbb98b9a5 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -655,7 +655,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
 
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index 93e1c04bddd6..96556ea754fa 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -265,7 +265,7 @@ static const struct pci_device_id cmodio_pci_ids[] = {
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, cmodio_pci_ids);
 
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index d2efcc92bb59..8d4b0a499da8 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -958,7 +958,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0xa1c7), .driver_data = LPC_LEWISBURG },
 	{ PCI_VDEVICE(INTEL, 0xa242), .driver_data = LPC_LEWISBURG },
 	{ PCI_VDEVICE(INTEL, 0xa243), .driver_data = LPC_LEWISBURG },
-	{ },			/* End of list */
+	{ }			/* End of list */
 };
 MODULE_DEVICE_TABLE(pci, lpc_ich_ids);
 
diff --git a/drivers/mfd/rdc321x-southbridge.c b/drivers/mfd/rdc321x-southbridge.c
index c44a76285147..9405d9ac9918 100644
--- a/drivers/mfd/rdc321x-southbridge.c
+++ b/drivers/mfd/rdc321x-southbridge.c
@@ -79,7 +79,7 @@ static int rdc321x_sb_probe(struct pci_dev *pdev,
 
 static const struct pci_device_id rdc321x_sb_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_RDC, PCI_DEVICE_ID_RDC_R6030) },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, rdc321x_sb_table);
 
diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index c53b5cfd675d..82628c2c0de7 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1641,7 +1641,7 @@ static void sm501_plat_remove(struct platform_device *dev)
 
 static const struct pci_device_id sm501_pci_tbl[] = {
 	{ PCI_DEVICE(0x126f, 0x0501) },
-	{ },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, sm501_pci_tbl);
diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index e75e1d6851ab..adf7a7ead3b6 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -845,7 +845,7 @@ static void timb_remove(struct pci_dev *dev)
 
 static const struct pci_device_id timberdale_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_TIMB, PCI_DEVICE_ID_TIMB) },
-	{ 0 }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, timberdale_pci_tbl);
 
diff --git a/drivers/mfd/vx855.c b/drivers/mfd/vx855.c
index 985f81c1739c..623735be62ad 100644
--- a/drivers/mfd/vx855.c
+++ b/drivers/mfd/vx855.c
@@ -105,7 +105,7 @@ static void vx855_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id vx855_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_VX855) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, vx855_pci_tbl);
 
-- 
2.55.0.11.g153666a7d9bb

