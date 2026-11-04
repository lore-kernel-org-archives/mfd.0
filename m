Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795861;
	b=p6JljdV1pJ7wLHblb2y6XH8FAul5j8jasUcDhA+ajPtBclwkzkWhFM/W8JFDgObd8pjY
	 y6P4Ky1p9rQJ27dB/WaCpQnXAJ4tyGPJnIzXdUa1tkeaUWdewhN9tOK14d0PZF8BPzL9A
	 EMi6mnqXWz3fMu+18spDoTO2k/H9+W/HpBd34YovxQzgLTQGtvwqQ0l5G+eeKK9qj2sZb
	 NPF+wkH7/WWGFWsRf1an0vkHiBwTszlIzpJ1JBXK51sSKgiw9kD65jUhvebrr6asdhyBR
	 k+cMexyumoE22j3wUfR4OWjQ0SMr42n5tpd05Ll1lilEk9Dc+bJx+baQWpUr/XP+LXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=B9U8bgFYjp4ZsxtYoDTm1ApZOL4sDt5jLqsllykfCv2oAymDB8N+oUVACFqKMEKzetMV
	 gtkg8YXpqYqo/bK4KaWYkP/Si756VvlFapAslFeUg7ojIiDTdwmEhX50jGxJTd30KrHp7
	 0dETbCbSwxjRxGi0quFuc6kXUd8FtJa9QLey56lydUFezfXqrzaWz0CqFQf+n4bjD+N2T
	 FCh4cXTAIxQoTvaqUZwKVV/TuGJ/md+hA5Wg5nH26YoxjXG7+wLFc64U7k+mhKw77Y8C8
	 ixNhp/iGeYpVOkZKyiE3QpC1g2q1SJhfDPAQly1G6P397bRsdPPHJs8H1f8btyXFYEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2hq8fM+;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E273606A32D
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E273606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2hq8fM+
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1042366f8f.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795859; x=1794400659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=f2hq8fM+Qb7jgiDCnIiJO84YxETK7afSaaCdnp42jI37jsux0zs2FziUHMLyjSy7wj
         RRGcwRQAOzq+HfKa8oarU0dRaQTpIAWmzcvmz12ZqnX6/qj8CGnDJsnXfup2RUeS7xXF
         c+uj6pdqAS3rT5+N6f1UuFVbM0JFuA+xpi3GRQVSdcIfcOh/JF/1zN5VMJy17hecXXF5
         7T1P97eciKQtch6Eco2OHeZzQXwZWdlYpHM8e9ICMDscxYT8SWeXh1HoT2TPlXxezIfP
         KypfMXol3euoTYvv6+N+3WcG2vQMQaQlKTZixu75GBlwWC9eVJEfTAMzhzQclOVlInFY
         Is2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795859; x=1794400659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=kd+FWE6eV3jhyB/CEhFPUwTa8LJ+QVLfRu+NkcBPO3tN40JPdiLMThQLKHantH+zAN
         3PlATwsrPjhr0tZSCbcwB23woTLUYJGra0erV1VQTA7FApqUj64VzuDC9Jnm6TRN4Gz9
         5TsLeMU1gjIJ8o0t3ns01S0IRBv6mOwldaUuDdYycqaZMVgYLCj3Om7cZdDt7ljEhra4
         LGjFTbFPnVKzCrNgcW1ih5SATcARhVJLfU/XOIbVDRxqetJ4m7g81uGQRAuDoREhY/A5
         6rLHKH39oVdnOmRQ1I1prZfSo9n9C23Bl7nACwTdET2X0EJHWpr3nVe3Vxw6Np4jvIzF
         is0A==
X-Forwarded-Encrypted: i=1; AKwUvBygm0cDekj/Ls0EXvMRs73VWU6+JcnS6qMhHWKwprw6ZPAI7sv3f2IgoxZwfqyqnxbTmSI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9CEnUMR+kwQyYjzVIqjwIYwBkcb8G3GNKt3O5loK+JXz+QRL0i
	Nu/hFRRfAc32dqAvCdhr7svWAhOTan/9PtYOFfJtYM0YksI72/Z93Pz1
X-Gm-Gg: AYBFou0rys2DGu5j1WEznMI7PDFb6G6IptJPVQv2mOisM/0Ze9qsLDcyzB+dVpr3DbB
	fPlhUNYUDRTu1KZp5RrfD2dUkfph5dwcrrlxsuF5cKwrI72nLsMa+txmRfQw4P7dzddjK0ClNYu
	SBfil9unFNtPrdaP+lHu1FDXM1L6YL32uX69nLKIkFRG+Yr8q2YrUDVgqPG0N70Q2ysrnq/0ZaZ
	KLgqEeogmmg0BZDjjuzJ1KDqUkTA6CnArp4Tu6N7XU0J/fCvlS7Q4Re5uFes7Mi9B5sZHnAN1k2
	tLvf/lMBtcp1PfQMrxolVyLsM0vJaNVhMdXJ7JOOIiKcp7P1B7HaW9xw24I78A6+STGvGj2K2K1
	kKWduQ2dyTvsyzs9EfCSLCADHSQQxEBpRpG+9ZmuPDcyMls41bCtV56WF+78wf5AsCkqeRuXXcd
	upoGCMAhBA3nCODwvXwpdkQA/nHjktIruFEa6Fzo4q7fJkOGmztUnBGLXkug1U87AKRzTFmqN9h
	A4Bb9+d4WCUFtx0WwpUF4WQuVkqqZfhrIy57O1ShM4EH5hSrsQ7Ui9k4f6ZnUkssH8yL8nD1BL3
	dnuHj5Jo258//PelFR7s9LtDij4XGxijFrssXfKM8OC07/K2nA==
X-Received: by 2002:a05:6000:1843:b0:48f:c595:d51 with SMTP id ffacd0b85a97d-48fc5950db8mr5312034f8f.14.1793795859436;
        Wed, 04 Nov 2026 04:37:39 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:35 -0800 (PST)
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
Subject: [PATCH v6 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed,  4 Nov 2026 14:37:14 +0200
Message-ID: <20261104123714.234634-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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
index 6b1040c65373f..657ccbb9a9dc5 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -308,6 +309,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

