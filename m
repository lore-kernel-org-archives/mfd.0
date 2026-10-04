Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F943BFAEE
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132107; cv=none; b=pDNmKQpfCkmdPaGSGXbTeoW2r68aluadZf9tmKH2ab2mZyK/fC4TQ/+yEaomTSUh89xYjqdVlcnpkgt8rB/61EjT3aa+wW9hI7CR7LnrT9A//iWaxhItbt/RsISaBjnTSdlBj4lMmcLZZN4h7+z+GDxwDjTtCVNvGwLDjeC9LZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132107; c=relaxed/simple;
	bh=9abUzeZOFHUuC8XhKlIBm5XhZ3akVALxDSkiJR3sypg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0bBalj0ZNmJzHH6AUIAU8lsCFy9jDFNbu/CvxRYSVK04R/CAhEz8pnDyEQ88jM6gcyTeAb7DlFxnoy7z9Zie/N/FKfEtQM7ELGH2AWl0j3WUd/XZNj6TFkID3ue2pgyzZ3c5SGcrL6xkm83tHbeH++iKgkStuRdfqGLADVOEAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrHsnq+R; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrHsnq+R"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so5850395e9.0
        for <mfd@lists.linux.dev>; Sun, 04 Oct 2026 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132104; x=1791736904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OmglYMJlZ0PFFt90eMP4sh4crhV9rDL4/VEmoOSLe8=;
        b=RrHsnq+RcXYgbiudktuTR2n+rKFS/UTCLWNGXfufqwq0Y+nyUo1WCQZFjBN4JtL/d8
         L9hn/FAu8dKnLnX0byzU99ibMlj1KP/j5m1cLpB5JDo+z/HZch+LdidncEIkCwzGPPgh
         bUXv6NeUyYdDTUzdKo6UeHl0j3UxOoReJZElEjdhSU9IxQosHlvIO/4nK1X2hAyBDgOn
         MW3raXm986Rulus1YP0Tm07DXAroa+UZhB2BM2NIbVlkOKYOQSPNDeUnN92h2pTgsfeW
         qponyEA/+rHspSXT5mBZ1/FPOBiTabpKqHxwhGp1mqdm81KzYNyGiJCiFCk37Tr4ZQKr
         l3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132104; x=1791736904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OmglYMJlZ0PFFt90eMP4sh4crhV9rDL4/VEmoOSLe8=;
        b=ihs8gf1OdpDG5o74wPY2YVNkbEvqXpFOeFpUL28dkjzabsHxgAshfV/8gfOwGDkL66
         oW6MMKrwAb9hFIvbgdTheeCYn16V9IQeWmzSuxgkB0QhyPmxYMpwHSb65pS+VeIYb2sv
         V5nsjajjGsVWwv2XSXqotdyx4/AOzJ8sP2rZHPsjruZbo36HQMWHJl3GlrHcGhHqi5nQ
         dWUb3VlkH1Z0X/3IE4hxH/YpORuF6tLY3UhqZDSZ+W+FfL/ndJYPqvLSjXZbEHP2GnPp
         t0IpC3EnUAC4l/xLOy8gspHpyDKtU1HCjXf+LHovshgkLc4w3tvfCd6XWuii34bySnAD
         jA+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKKp3MjsfS6rMC4QJy0RFIxf19A7U/AENFjzNzEtiMbaFqVjddowK6Vaz+eCVrhVxYvp8=@lists.linux.dev
X-Gm-Message-State: AFuF++mrSXME1nYw8SjU2rUbUOUNe4vCNIvFp+TbWnNZc9cb6MKx0vkp
	EdZOtWuHjmRDq4pCIc1iPKPZdTsEiGPC6/YC7hTdEU8UUpz4j2uysRwi
X-Gm-Gg: AYBFou0G26stdUsTtmy+cDtTkR/Ddw0LWcWu5o8/7T8lhmUpnpOt0MCVNIDN+a23/YZ
	V+wgLTp/zPXYGHWXOq0CqY1shzCTS2JSQVJfCX9pltTJ29uzVzgrv6eKhtC83bkofFh90/5hqGt
	HcpSABLoFA2VWw8Xblmgi7C09UJ321bhvHA88r45cCRtgkGKSmnamGFb4Rpgor8I4xnQZhyzLcV
	ofg+y5OfXA2P/yv8neIPKxk/Atnej0EEVbyT6rHBu4OCj0kgDMYJS9+v5vtXrKfIe2ds1fNnMSD
	Cyqt3TJVNLqPfUKm4NfCKd/R41G43bHsuUWy8qEGWh6PBKWL8YjoWy3lPAD9hO0S2goS+fQHCvp
	lUKSmgYMoiQ9oLiXSkiBRjQbrx3MKYQtP/KPigS3Ly5AZiTjawYgwEQh3Ft1zrFyIp752Kw3SFI
	C+KEiw+co7TDo8KiTdKA8pMtGQhyGGJImYUq06oLiIKc3wKI6+3GgAD6MX1sqPUwQvsGCc9S2A/
	pzvtUMZK0V/IFlTR6c=
X-Received: by 2002:a05:600c:6995:b0:4a0:1e53:e51f with SMTP id 5b1f17b1804b1-4a02758572amr146705745e9.14.1791132104073;
        Sun, 04 Oct 2026 09:41:44 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm18765185f8f.10.2026.10.04.09.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:41:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Sun,  4 Oct 2026 19:41:21 +0300
Message-ID: <20261004164121.193514-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164121.193514-1-clamor95@gmail.com>
References: <20261004164121.193514-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 909c14ee60323..0bd430b90bc1b 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 
 struct aat2870_register {
@@ -309,6 +310,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 8a58eb27f3f5f..a921e40ca47dd 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -114,6 +114,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	{						\
 		.desc = {				\
 			.name = #ids,			\
+			.supply_name = "in-ldo",	\
 			.id = AAT2870_ID_##ids,		\
 			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 			.volt_table = aat2870_ldo_voltages, \
-- 
2.53.0

