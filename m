Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432771;
	b=nkV30IkbwWDgQxXZTMNnyuZkRtd7jUPUoG8xkt00rqpibqiuSUwVo0oIwcC2wONThBn9
	 v2c5/qBPhZajAvDwqj60kDUz8/lu2z7Er7Yu+a4dmhwY61KTuArNx+WVUYRnseF4juDda
	 5JRH1PnZZaY1+9msnRDj4PpwxmuoD3pDDaJQgb/la5x0ZHH5DO73+WA8EFoPa+GLAShkr
	 yAW6gChZHjgZQ46ubhYILj8f7L1iCU5y6UhpQmmfHA5UM3SEmTZnDzEAyuJGIh1AuKScw
	 2LnlMxArOz8AtsSB20gNmBjDmq0w2kNWfBPFfcrXozwpNFmTqj5cqimqSaPYTgPUWvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YUXTW8SKxn8Wpo9ruaaiGpQxcX3RyegPc9c7rxFhcBE=;
	b=0Ny+n37yRAoy+1b9CZ4IknVSXDTYgVon9e2loZyXI/1ilgA1PEgtFNh+Qpku4nR+fc6X
	 TohZo735VQUaMe5dURBMw7T8lwNBbbyhLRVIUwQX7moEVVVzxhPeoGnf2lQ8pY8gpOvbJ
	 kRpttYc9IoTFul2W9lhv6CRAJJD8hMhlHdGRLKmHhLv4bquW/mMUZ2w2Gj29hMDHfAel3
	 dx1AhigaDYjdkM71SXNVRON4f4aOOCyl04WBTcr4Mz4jx/SFHcVluI0TbfvOpOzWkpu2i
	 jShOpgslaNxsTDwb7lzCUGBjbnRcX67ZdMH69mgyxl0BaHgAiPkBE9n6wogoX6V8+Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iFk+PzVW;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D6860A260F
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D6860A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iFk+PzVW
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb606491faso17347535e9.3
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432768; x=1796037568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YUXTW8SKxn8Wpo9ruaaiGpQxcX3RyegPc9c7rxFhcBE=;
        b=iFk+PzVWMSpMDkmfNZtS0j5lJcbEcG2IlodE2zvK/8hcsjRAJKtAbrFKrZVMuFr341
         v7U23hs8lphT70gMzoBL7t8bJCs55YJKvY0pE2fhoixy+I0ikFckJA71UEPIC96oKaJ3
         A3odLOWle3YF4Wl+DRIX3NVnZlTwhUSLCDV4zJBLkpxEoaCNlepzhtSQIAYCFH3TCs4Y
         pkmzvaIiQyTdqy/2xq/unV/31OeowIPaA4RmXGSD3BAFBFOitvFwxATUXXOQbiNGhduo
         aqRl9T34wcloqy0bu0+L6R2I1CzuYiGY21ZdDP3M0QMn1rlWzdsfh4LOBHjxVggPTw21
         T/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432768; x=1796037568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUXTW8SKxn8Wpo9ruaaiGpQxcX3RyegPc9c7rxFhcBE=;
        b=egZVywTSi9DltdShqdVl10cOWyQHMKipUTGhAs7W47Hasr35W+b5LlefZKNkT+EYHh
         8UBCrSNG6k6KHE8cSiVFzjrXYEG7/DPZJf7q/nqbwuscVOQ3Nxe6Axa5Ppj1C4SA7DzX
         3v6rSOh7Ee0vKJMTbuwd+hjTkRijw9XO/psqco0cJmJEnaCtc6/NInAQkhGZlJaQJEpj
         4BbSl1IUokQqkal+VqT6VFONA//341ff7MUU3BMqzmuQUo4JLUCnj7iB0e4Ze/rb4mB0
         rBGJb9pjwUPZ5CKFTHJdajY1YjfHAMTzQ+uxLSZvsMaCDt+gOKTGBCWYyMxp4oiEY++3
         C9tQ==
X-Forwarded-Encrypted: i=1; AL+hErH67IRkpruqvp3DzoMomk/fp0AuoLLDOAZTKTcxCQt3HxZ6P7n/j2KVur0NfGuPirfjsh8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+qDD/qYxErpJiwKlPYHKNhO00zg9nqT+k/0FFX/GfaqEJNJakQ
	MgoVvbXZt9uGiktO+NEBXWEb8eIpymZO3lWrjDLU09KdgCxyi0JCh5AUjwZYdz9eogs=
X-Gm-Gg: AZFdTZcaG3WPN3Eq+87Mi1fprn2N2vC4vYrkKpsZAUgfn+Xos+VXcjZGI0epcIpAegO
	brVc0JahQJBoK0eDn7djmESPtLU9C/2ZX7lAS0MCUVvYMkfwmm4Z1xoZqgtIsdoVbxSV5JCS17R
	LoqWA6juS7lGGdEheCIq8+NjXb/yMo03D+Vo7A/fvYMNBDNEtTLMrCxluFm04ee5Un4AIicKBI0
	0cN5JL0ltGtw/g3qEwWVlLm1HkVgFmCbAI2LK9fj749m02KTuKkqhOa+eK5U1i42/oGU/JHBqxE
	m6YyjnfqrypLMDAqxLDTYzV4ArO2DpP+0PlGmzKtMSWl8Q6yVJCriUaiHPmdXgTBE96XapzvVC7
	Q55jHGIA0m5IbfzsuJnUxY3rXC+/h+J9gD5cRFtis4RWVJZpudoHz/M/4VV05L4HXel7wk8SqNa
	oGRviKxle+CaoY2kfv/br3Ws7LRkeZ67Y2HVXfQjoPj6GZ1OFmqiuW028pIIQ6wQgWnStq8D6ap
	uZYg65sICvabpVdImP72+Qh2YjSRvoHaN5dC7UBPbJkUQ9cVElM3R4C8zOPRm6kmKTCNaSHQMig
	qYhlUimb8ImE4OMDTOwL9kunOSgVlS0ix0fahFBltwgvP0I2F6RY8XQ92XzIkOr62/GNJQVwaa4
	4dQKV0BfWR+p7XdGD
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr231635085e9.24.1795432768035;
        Mon, 23 Nov 2026 03:19:28 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb9065744esm147721245e9.1.2026.11.23.03.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Peter Tyser <ptyser@xes-inc.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 17/17] mfd: Unify style of pci_device_id arrays
Date: Mon, 23 Nov 2026 12:18:15 +0100
Message-ID:  <efe17ff4ceea6df09ff98818c365ad31df11fae3.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5272; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=keSdCWc8b6i5OedMT7cIB7iKQFXYLPvQ+pKYJhooRnk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEU9dvITQixoFy5IuQcdBWdwHMSh1NIUouiu Y6B38HGAM2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhFAAKCRCPgPtYfRL+ Tga5CACxrjdW910oA9QbL+KHow6JngPLeLLPpgUbrOS0QCojPhq08gIehBwll/iPPqlVPI4qkJw W8aTRdHt/o7trugWvlPAFXmdUctZ+9DTgD0Xpbf9BF/YTqUEJEZKzppyRalaNqUW+pJtulOLOUe IhO1OTZqpxwpWFMiODFcZyYRvo5uhbN1Uodq/xWATBKejx5W7ru54uZmQD2zZwf7ZiTsxiUY4EB sHcUC4ylklcwQMnf62loePw31FQpqjWTwnGbQoy3PG6vy9UjhP9UxL5lSgSqrOuKfySbdlu2TjN ry6tMTSj7J8tQNk1C8ZSKf5f6FkYOUMCz1nBxLR+fwwHPODq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the offenders accordingly.

Reviewed-by: Linus Walleij <linusw@kernel.org>
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
index d91d60dc5416..a47f050f27f6 100644
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
index 7f8c16d82738..08dda59b9236 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -148,8 +148,8 @@ static struct mfd_cell intel_quark_mfd_cells[] = {
 };
 
 static const struct pci_device_id intel_quark_mfd_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x0934), },
-	{},
+	{ PCI_VDEVICE(INTEL, 0x0934) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, intel_quark_mfd_ids);
 
diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 34e4db8c2226..391477450287 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -662,7 +662,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
 
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index a0cf86460a23..659b926a0aee 100644
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
index 783d44355bc3..8e4482c43e0c 100644
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
index d1a27fef79a5..e84009e596f3 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1642,7 +1642,7 @@ static void sm501_plat_remove(struct platform_device *dev)
 
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
2.47.3

