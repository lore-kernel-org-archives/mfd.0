Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983396;
	b=u+qaHboVItbaNjR7vJxe7nWtgqwuhwAXPFiNPUuMqrL1GwfAMASHy++JRcgMnObw2D+q
	 J0nYhs0dn5+q3/cLK5RHtj9LNA/1OY4oUSADEt6wdvJr6zNzNwTvBEoN/ASNZnT71wz9R
	 bUL6G/xaje4PT5tDflt+eswVi1JzVrF/ybPaoSmnCyvm6F5ymvBcTZ0FpqMf0pPXXPG3j
	 YLWq8jUtHNyY4Ar+y5biFXcni36VHAO14yMxzHxl+oRYNB/4exqSYtj4peJYzIb2xWTNY
	 CTB/2qzBYAmWo6+GKZf67QopKYCImeIimkonIkO2NYj1U1I1UKuYFfFy85b7rSZblkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983396;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8C1So1mmCsoiaLd35+rXvL9hXixjldKX5HJN+wIacvU=;
	b=LoI+a1Z4HaAvou0Z7ECT2ensH9Y0QAXl6oRkiAXYoBnX2fXn8WqQ7pc0WG0Qwz9VEb3f
	 kg6iSI8NPN4vyoYtxXXvYxxBAI1gvElTKHZJ+E656RVxse0Fa8Q5raPNrpLtzSVa7KhwN
	 rJX3vW3Ju+yLORNpc609juMM9KRsOBRYch3SEyE05Yb+3yztVGC0wnULIKBV/MhKJ8pgB
	 BjSSrZPyvh1eY/4ZFs7b7HAdsf4Xy5lBoWl6ERmLPUUquYhppxx2+ZDYODSd+oeVfy0kl
	 4lemQNnMKqLHnAJ5sGN/tIJDd+adQbvkyPFGaqETDcbA9Iz/Uh+ThAdGZfGud/LZ9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BWJMHDXt;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13AA606A31C;
	Wed, 18 Nov 2026 06:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BWJMHDXt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BWJMHDXt6D3OdDJR47P/ZU3QygMYvdeKqfxuMcV3mxkxk0jZpBF8cMWkr3nEb8PJsuSkQHpKWgpRJ
	 UFOR3IV4UimDViY947yVOdoH6dxa6qYLi5fX1GlAN6KY5CC5fSU1YXbymx9cqQiluavoTAFb3h6+Th
	 Vim/7W+nGlX7iBj4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd45df469-b085d;
	Wed, 18 Nov 2026 14:29:51 +0800 (CST)
X-RM-TRANSID:2ee46afd45df469-b085d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86afd45dc8c6-34d8f;
	Wed, 18 Nov 2026 14:29:50 +0800 (CST)
X-RM-TRANSID:2ee86afd45dc8c6-34d8f
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: bleung@chromium.org,
	lee@kernel.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	jthies@google.com,
	chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Date: Wed, 18 Nov 2026 14:29:48 +0800
Message-ID: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

ec_device_probe() calls of_find_compatible_node() only to check
whether a "google,cros-ec-ucsi" node exists in the device tree, but
the reference held by the returned node is never dropped.

Scope the lookup to the UCSI block and mark the node pointer with
__free(device_node), so that the reference is released automatically
when the block is left.  Keeping the lookup inside the block also
preserves the short-circuit evaluation of the original condition:
the device tree is only walked when the EC_FEATURE_USB_PD,
EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on
every probe of every cros_ec device.

Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI")
Suggested-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---

Changes in v2:
- Scope the lookup to the UCSI block with __free(device_node) instead
  of a function-scope variable with a manual of_node_put() before the
  condition, per Benson's review: the v1 lookup ran on every probe
  (breaking the short-circuit evaluation) and the node pointer was
  tested after its reference had already been dropped.

Link: https://lore.kernel.org/r/20261118013935.1573-1-laixiangwu@cmss.chinamobile.com

 drivers/mfd/cros_ec_dev.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b80..b8d363b7a 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -271,14 +271,20 @@ static int ec_device_probe(struct platform_device *pdev)
 	 */
 	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
 	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
-	    !acpi_dev_found("GOOG0021") &&
-	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
-		retval = mfd_add_hotplug_devices(ec->dev,
-						 cros_ec_ucsi_cells,
-						 ARRAY_SIZE(cros_ec_ucsi_cells));
+	    !acpi_dev_found("GOOG0021")) {
+		struct device_node *np __free(device_node) =
+			of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
 
-		if (retval)
-			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
+		if (!np) {
+			retval = mfd_add_hotplug_devices(ec->dev,
+							  cros_ec_ucsi_cells,
+							  ARRAY_SIZE(cros_ec_ucsi_cells));
+
+			if (retval)
+				dev_warn(ec->dev,
+					 "failed to add cros_ec_ucsi: %d\n",
+					 retval);
+		}
 	}
 
 	/*
-- 
2.50.1.windows.1



