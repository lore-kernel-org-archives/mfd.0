Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D99436BE4
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616446; cv=none; b=fExNOTpSwg2KqzLy6mJvmVrmTXys4cDhNLP4ni8P2aMuoTvkej+h1sMOhlrtdrhjJwBE0JcoCyBHhZGBVL5qEYp4oXVAZXiLrdYAV0wYxFUr2BUaziqcHN+azMZgoRk4E2XNAnr0PfpO1/GRwjrEalV6UQ4zwNBGVHbKpxD+KKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616446; c=relaxed/simple;
	bh=bwQ4trlC//Zb/ysrr6TEqa0K36yYnlKZDlcMALAt9eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDwhRMux9PVS94l9T+sNK7QR/Y5bnnGkrB38kvQq1W1eMTf/kwsdFrjGTD8A/l85R3pQJyCSyxRmaL0VW82XA5Igtl/aJA4iFU08fYt2OetMvfVpK+MVN7rdhpkMpHJ2SJ6ZqaBVl76jeAlPTYbE0tHHkAJvDoJ9XBMSVCnVqAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ewp1N8K9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ewp1N8K9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b7612475so128565e9.3
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616440; x=1784221240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uZRNsR/s0rCxhsVLSAGiCibpnPBQio1HUVuPZ2XkO64=;
        b=ewp1N8K9XyWqquAXthopSWa1ZTkn220I/Ns9pnTXjObTTA82p3c0SxG0It5Z66tdyS
         NreKlaH+A4fhVuRYkBV5S0STK5JdYDeaMEvNdWnjy6rEPuoNwxalZBcQT999Kd+2S9CY
         cRbiOC6tpCdui7RpMTsbmoL9NQZbAqAoPcDNBAWaSAl5h6nMchQur6naNAc8jvo/F7uB
         nKP/xPk4cDwv9zPDKQvwydqbMLTl/AiNDPlh1WwVA4ib309oLGwlEY8FVEcPbVW5sOEx
         iBbUBzjLMXVKHls62L7v4299C6rDYPBbgKMTM+cgA8q7jh4CKJpvRk8ZlZM7GCtJ7/GW
         bTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616440; x=1784221240;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZRNsR/s0rCxhsVLSAGiCibpnPBQio1HUVuPZ2XkO64=;
        b=ePTt8wokiiCSm2rOB7BcMkj6AhNdJgTkhNu0OfV/yMWuvfayO14USfjNZ0qvcgSl+q
         1+bgxKd1CiRDORqoochgthYbMHCH2lUkyOrqBl2z3jeeMuRScXQy0Cd3cDIl53PXb7nS
         nM3eD1O0aI28E0xi9ixrQVPE1okcyIvEOLX7ZCwXxC9hHFSd4DrTGQZWVtV20IpugteP
         b/6j1cQs6aRAXo70zawoG/bHkcSClHkMgHu5Ibed7Kao5vI8X5/XbpV60GF/by9fTe39
         v0EhvhPuqnQMrpdLwb3O59FN1G2K7exlOZ3zHDRjwKlKzuba9Znzt5FKowrSQ+kva4lv
         TNPA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5Ex1sdcfbDWUw35cHEwlOEa+AGIlq32XNNqmQWDvSf/zMCxlV1trvtWrFHBO1ttNhGLE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx9jd5/U5TggoxJJGuOX5KTf89qN556HRdVIzad99hU0mQDoKF
	0z+7E6J6PN7nIm9QUSRIqmLh7j6yZYKIJbcLNPn6dTMpUeJi03I43Rkd5h3VzUhvZ+Y=
X-Gm-Gg: AfdE7cnRNfcdJCaQpfV0MMASW9N9MJejSBtKvm7+I6uKVJJHgDlmyZ2Yg8bipcKHpRc
	p5boPFgC3vJhMdo+dzsOE44BLxqkqhgY5PTy3EkBR9HvSkMxLDXm6AQvXTd8yw14cM/n+2ux4/2
	o/fQPywi60o/HIRSIevEhMMzZXy5tfeKmAFB6Oj2KtGDGgHG4mZLoi6CAlMwg133UGmr/zBmDK0
	RuJZ+Dd8fdaBIvPo5P1gwLNTYJgtNCtF6WB8jIHposK+MdS1prr1F/Duhz9DIZAStm93Mc747uo
	i1See/GI2tuFDRvWqWLcsPf6f2+/mQ0jHplXh81wV8h5qUVYvjBhhK/hb+6wAccYhlu2qxuF3YV
	Kr25gm6fkvB4aPdJo5ixvK+cV74d60s1adlE2C6UXegG/swKZHKYkZFstF8h27+boPi0qnpj1JG
	wZcsapCdKLS0bVRmK7FmpQdi22++RsSkTICSMREufDsgPILPeAZVMOSI3nlc5Qn296TpRVIUkse
	jmW
X-Received: by 2002:a05:600c:1c0b:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-493e6864191mr86497325e9.18.1783616440051;
        Thu, 09 Jul 2026 10:00:40 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6e0e5asm77944575e9.9.2026.07.09.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/23] mfd: Unify style of pci_device_id arrays
Date: Thu,  9 Jul 2026 18:58:41 +0200
Message-ID:  <92a18ff85964ceb1992f964d1325f9d10f1ee1e3.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5241; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bwQ4trlC//Zb/ysrr6TEqa0K36yYnlKZDlcMALAt9eg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NsTaP0u1Db/9rz5U2Cc8gymYK417zKW0sYx 665KIUP3H+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TbAAKCRCPgPtYfRL+ TsCQB/4m9ju7iH+Z35zC4d7areaKUvWqXV1WhzXr6nFJTNY9kwalcYCgRCQX7Bg7K4xIF5y++GY SnFG+esQNYu3wn0GNd+7Y8pwVQJMJsLPEjumCHgRgWfH5NX8zCQ309PPnibH7eCeiyxLAuUtRhC 9kIt+GGLBrFp7zVzNrClAhMUnq8AQ9S9152jUEDd73W4jfDvnRufPjwG4n8hvKYzwx6jeMAA8Rq Tvhq18OUJD8vxVc3TFNnLi5NtXcodi5sRTFA8BwLBzY6hOYDW4Skzc88aVwymFvxcrKuIaw9v4+ kUDtD/Ln8ZKTl6PXKEFNr10b8KWYv+HVxO7yDL8EAhLUs9CW
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

