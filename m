Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC4394788
	for <mfd@lists.linux.dev>; Sat, 12 Sep 2026 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240358; cv=none; b=COUFZyd6mYKwZ8Fj05pT8VplKIJEv6Pr2z3EDSEQUlMvuJeMnnepELHnO7Hmw9J/Toe0a5F7QJ2KxDd45D/rY/cnKtOgxTEh68SSdeaKcRcQ2M14RscPq5D3yWhHmZB+qLtaPz2Cc8Uef3z8bS6WrKG7VCb6PhHkAZJm5HkV3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240358; c=relaxed/simple;
	bh=MVDg6heCaoD/DZvcXr/Fgow4fDzqYEbNs3IMvtWRxe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PC422csODF3zHwVuLOUZlGiEmkGa8Ujd6JE4NXVa96N/Ov38pv8c8CN7XfUKgvn2tBX7pShTTnhhJJcmLz44ECmN4mSkkwa2vYWOlDeZAljTkAabkjoNeJ3Dpgexe+XIRBB69pdu7JDZzHR0vFS7AN/TrKETilWYlWVhSda2+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvREZZro; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvREZZro"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76c9df1so10537641cf.3
        for <mfd@lists.linux.dev>; Sat, 12 Sep 2026 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240356; x=1789845156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVFk+dJpAVuL1BqlzjfuC680+HsicXDkJSDggWI8BGI=;
        b=HvREZZroUYQQ8BwQzYX6hozopKv+URn5rSccKs89CU8Oicb9gXD/PP7Oe3tq3fEZ1E
         VsVeBQM3yNwNi2W515bQKtFZI2w8cpxHMmUunMBbYQ5gQILLJZHiI1PddOQgBBJTj+kT
         SAaFdSMzuWvMxVZ0KtZAMq7ZhAT0p+FVucd4ukeYChpta+4XL8cTeRsLGkArOvGFzBPN
         08BCQGYa9b+GdHSj4YG0sOsDq3NTTS4lna9LG13o6vtb9Sb7o2rEDdHeilQHxh73p+c9
         qlkLpUFLGngclbCZKOEFyyjgVaqIdwQej0lR+DWbHKWeGEYGwy1EOlQpw7qEtaviyfH0
         BhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240356; x=1789845156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVFk+dJpAVuL1BqlzjfuC680+HsicXDkJSDggWI8BGI=;
        b=CivM1nQYstAAdOYRiBffUBEoJDDFbPg6tPGo2upcnGKVn5vp/vARtHh3T/cibk6S0P
         Qs7tSZoOB12oSOelXn79w0ikbz2YrOZbIv+57iy+WqHiXR/MNHw16snpawpQSqj48cP8
         T86hHtNr2dH0au0slwXgKp8YJAxNd/+KZfDbz9w2qUnGBhmKl+0P4hKrBBUqhucjUhYh
         3JNha4JY0UeaBGmgwaw/aUP1seePwgNjQUJKowOPI0wHgJBagq/uoksku2i8TuepPamd
         pZA5MPvt4F8CuAuFRKUmH6hrzM+pILp1NdxkgKohFCInz4HTOTOlpHmJiTk77K0TLbCx
         iNVg==
X-Gm-Message-State: AFuF++nrSutBGKVEkZbJVEjsQ4ogLaEJpr9ofMPj+K1xZAguR1TKUZYR
	rq+9YJYBwW02bS3+12zplbzUfRLQoiaPW+/7Tlk76z05Aqiw0OheP80=
X-Gm-Gg: AYBFou0Yda4ZbE/jtI079hBM3xCZpxMVOoiEwDtf+A47mdI3PNKBws/5h74yd1BSrGv
	LqmItY25kbFhYvlBNm/u5pYDPVFmjEQj/Lwg4itH5SRanszPMYLdb7ISH2SEVJo9LKRPgt//42f
	C9JRr0ygRp9VH4NsJgZU+uN/5bLoQ+V2wnwh4vhmNqYt9uNZrMzwBhx/C1eUo8JxgYx25jrigkA
	xb2rlywYgXCLzUK5g7f75AaMokYmOVJ+78ohC5a03Qt8B/HfnUGfB9Ro4hnJwxpZciaGUpywkLd
	spsytuatPM/x0j7sJOKC4vox/FFgD7Xt4i4JE+qOo2OFymt7zaaCpnF6B80ba2o+3q78A5JN7FX
	9RtfSDWkrZCBwwV2s9frQe6ln2T7py2GKw7UdpXPTkQxo3jC8eY0IE4E9CKzi0vKr5gZwjom1rj
	FolbVaR4qDFKHz2PCjccC18v7mfhQcZj/VpzvsrhltgY8FOzdXIU764ew2p2cWjlprlbuyD+h+Z
	smh56ZCvsWGMdQJfxa1Hcde6QLbCanjjfqsPDkFN9272L1DNOf6YHnh3ImixAeYoCik/LoldGOm
	vGiV2xKANsAntrrrcKQILtLULYXnzg0cYA==
X-Received: by 2002:a05:622a:4116:b0:51c:1a46:9148 with SMTP id d75a77b69052e-530e819aa1dmr60250491cf.34.1789240356210;
        Sat, 12 Sep 2026 12:12:36 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49661asm52023006d6.30.2026.09.12.12.12.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:12:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: intel_quark_i2c_gpio: manage the fixed-rate clock
Date: Sat, 12 Sep 2026 15:12:23 -0400
Message-ID: <20260912191223.46136-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C clock is allocated by clk_register_fixed_rate(), but cleanup uses
clk_unregister(), leaving the fixed-rate provider allocation behind.

Manage the provider with devm_clk_hw_register_fixed_rate() and its lookup
with devm_clk_hw_register_clkdev(). Managed resources release the lookup
before the provider, after the MFD children have been removed.

Remove the manual clock cleanup and the private structure that only
stored the clock and lookup pointers.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 60ae5b9f5cdd ("mfd: intel_quark_i2c_gpio: Add Intel Quark X1000 I2C-GPIO MFD Driver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/intel_quark_i2c_gpio.c | 52 +++++---------------------------------
 1 file changed, 6 insertions(+), 46 deletions(-)

diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 9b9c76bd067b8198553013af70c9123e33fb9041..443a1a0cf7778d400b40e0c75439e3c7235f8ec5 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -35,11 +35,6 @@
 /* The Quark I2C controller source clock */
 #define INTEL_QUARK_I2C_CLK_HZ	33000000
 
-struct intel_quark_mfd {
-	struct clk		*i2c_clk;
-	struct clk_lookup	*i2c_clk_lookup;
-};
-
 static const struct property_entry intel_quark_i2c_controller_standard_properties[] = {
 	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_STANDARD_MODE_FREQ),
 	{ }
@@ -160,37 +155,12 @@ MODULE_DEVICE_TABLE(pci, intel_quark_mfd_ids);
 
 static int intel_quark_register_i2c_clk(struct device *dev)
 {
-	struct intel_quark_mfd *quark_mfd = dev_get_drvdata(dev);
-	struct clk *i2c_clk;
-
-	i2c_clk = clk_register_fixed_rate(dev,
-					  INTEL_QUARK_I2C_CONTROLLER_CLK, NULL,
-					  0, INTEL_QUARK_I2C_CLK_HZ);
-	if (IS_ERR(i2c_clk))
-		return PTR_ERR(i2c_clk);
-
-	quark_mfd->i2c_clk = i2c_clk;
-	quark_mfd->i2c_clk_lookup = clkdev_create(i2c_clk, NULL,
-						INTEL_QUARK_I2C_CONTROLLER_CLK);
-
-	if (!quark_mfd->i2c_clk_lookup) {
-		clk_unregister(quark_mfd->i2c_clk);
-		dev_err(dev, "Fixed clk register failed\n");
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static void intel_quark_unregister_i2c_clk(struct device *dev)
-{
-	struct intel_quark_mfd *quark_mfd = dev_get_drvdata(dev);
-
-	if (!quark_mfd->i2c_clk_lookup)
-		return;
+	struct clk_hw *hw;
 
-	clkdev_drop(quark_mfd->i2c_clk_lookup);
-	clk_unregister(quark_mfd->i2c_clk);
+	hw = devm_clk_hw_register_fixed_rate(dev, INTEL_QUARK_I2C_CONTROLLER_CLK,
+					     NULL, 0, INTEL_QUARK_I2C_CLK_HZ);
+	return devm_clk_hw_register_clkdev(dev, hw, NULL,
+					 INTEL_QUARK_I2C_CONTROLLER_CLK);
 }
 
 static int intel_quark_i2c_setup(struct pci_dev *pdev)
@@ -238,19 +208,12 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev)
 static int intel_quark_mfd_probe(struct pci_dev *pdev,
 				 const struct pci_device_id *id)
 {
-	struct intel_quark_mfd *quark_mfd;
 	int ret;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
 
-	quark_mfd = devm_kzalloc(&pdev->dev, sizeof(*quark_mfd), GFP_KERNEL);
-	if (!quark_mfd)
-		return -ENOMEM;
-
-	dev_set_drvdata(&pdev->dev, quark_mfd);
-
 	ret = intel_quark_register_i2c_clk(&pdev->dev);
 	if (ret)
 		return ret;
@@ -260,7 +223,7 @@ static int intel_quark_mfd_probe(struct pci_dev *pdev,
 	/* This driver only requires 1 IRQ vector */
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (ret < 0)
-		goto err_unregister_i2c_clk;
+		return ret;
 
 	ret = intel_quark_i2c_setup(pdev);
 	if (ret)
@@ -282,8 +245,6 @@ static int intel_quark_mfd_probe(struct pci_dev *pdev,
 	software_node_unregister_node_group(intel_quark_gpio_node_group);
 err_free_irq_vectors:
 	pci_free_irq_vectors(pdev);
-err_unregister_i2c_clk:
-	intel_quark_unregister_i2c_clk(&pdev->dev);
 	return ret;
 }
 
@@ -292,7 +253,6 @@ static void intel_quark_mfd_remove(struct pci_dev *pdev)
 	mfd_remove_devices(&pdev->dev);
 	software_node_unregister_node_group(intel_quark_gpio_node_group);
 	pci_free_irq_vectors(pdev);
-	intel_quark_unregister_i2c_clk(&pdev->dev);
 }
 
 static struct pci_driver intel_quark_mfd_driver = {
-- 
2.53.0
