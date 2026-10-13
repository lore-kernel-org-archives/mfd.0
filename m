Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D9531626
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914998; cv=none; b=TU7kmZukx4gfu3yDVrzFuDedmVBkVRRXgmq1Anrf3ef4ovyFyHjkT7ondhSpQHxVixFf31uKPAuzFklBLGcjd6riDUNyxJzmckuTWdF9YHehpVtaRO8/vJQ3jN3MfnNnu7ZgwqIpJOfg3LCXS7GGoOlYoPzpb0TPmg8kZZPsD9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914998; c=relaxed/simple;
	bh=wFz9qtE4/v6AkxRE3jysvHKfWx3fP77bQotrkPc2bDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s525ghLsn9JOwoLadG2b7epWywFVDSJHmXYNn97dP3QLpqLzuX/XAg8N6sS7H6//Cp+GHpJcBhIu7dkDDRuemKJvbgXybTyVCQP4GzmoV4HVYb3UYIUYIj6WIA6W22lSU3NtNqrCuZHvxf/D/WIbuLebyWN/hXlKPeKLoLTAtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNxsbv94; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNxsbv94"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ff680331aso1809295e9.3
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914993; x=1792519793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIN9I4fxO+jG+4Tem3JpMlKcKCKDmfxcYWPCA9fO/20=;
        b=cNxsbv949pqIFVD5ha4aXCihWSZU0kOIEej/CemQuEyiNdmVEqhBLJd6ex/puUIkYn
         XywLPxdZAyjF0oBxQn4J8kJp4PTQ539+ZevCcPpWwyUy53GeOgYMBzqVIR0Zk2PbOns3
         W58kwXfL2jgJL0p9h7xmvww7klLSxI8lSbbMaYf+v4idL0MgsFNqSwQTOKzjRK9MxTaN
         GWjGPjuBjkgM95r9gJZ/h5Ta9uXqq0pc9/RB1IUOL8KYHC8zYAp63/XZBiHUzoHAsS2N
         Ov3w3iXApLEcBcc+1a+ZWwtqLVsshyJmVqR8lZTrMwveSWBhmiE1dKnOue8lEERbuxtB
         VVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914993; x=1792519793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIN9I4fxO+jG+4Tem3JpMlKcKCKDmfxcYWPCA9fO/20=;
        b=fS+u8yqcyl10Ric7NNOVlN393KCzhZoHaIvpkWh/TGmMLxLOz9GLoOuvocLR47pBbJ
         gOtcrrRqRZTFnNcvNMN3r2m9Xr8bnBpfTwxSbtatlHSlRyAhLabVRuK/XC9yDWEQWF5T
         AyeY9zC/RlJcPyXu66AyUuVonO2xDJ4Cf8X/EwOWNw1Qv0SK90YybB0qV+eTRVFyZ3NK
         ddKDwpt2TNV8Hbzt993ACCBODnOvFsaaQe16JeoEzTS7IYuYoeZQpf+L4srzZ9vxO3h0
         noVKM5QcqSiEvt2oJVa9GD4TaZznWT7kkOOlEAAr7e9sNbjYFzX2fM+iDQhNC0mebP1M
         Ip+A==
X-Forwarded-Encrypted: i=1; AKwUvBykpVvRe72OH/sATjMs3Tq4KnscQTUfOZMHJIgBkjByMRjkJy3KUgd45gFta58fp7MNNVE=@lists.linux.dev
X-Gm-Message-State: AFq9FYItS3/K8s6sQUWMF2zxspAda9JfL5bbAr8MqWUu4oIyILys862p
	X0iZr15MaKbQZBCm7ajcLBMosBjBoDA2dcz7imOvJp0Ey/QxTv6/zJF4
X-Gm-Gg: AYBFou3pQOACrn4d8WKtwAyLVhivt7j4dDG74vJTm6sGiMcnAElrF7CJt3wGGjGXgNU
	Of03W40O71BHlQ+0dI4Lct6HiQRioDX4zYETYEnUfKqmQPdYOJpkXsJW2N5xKelqTqvw/h6/e0D
	tBkh2rr7m27NEegYLZNTFOH7+TTKVgPRIzTmbOHaiYEb5zsUoxoD29QQmyk1Fy1iPkbjHLm7O5a
	qdHlzkKh6Db9+eVobScWND3t5X64pNxzYrQqPqVIrQZ12zu5mwOzK/3W8ZhRZI7LGyQWQZBpn2M
	sx6gKFIxov9x8uqdE1VosIujFnfF5aJ3jaZEzfXPmz5QD53b7EtkHYbJwrqbHTuzPSzkLi6cjIB
	ri250OAVFvsN4Z/w8zoWZ7OqcYlTjBls9gHtzLOtKoFQ9p0vkx7q+YmyG8ezYSGsROo1Nc5g5aK
	CMQu76dqIEbd688T8u2Ra2nljqD/WlpCVDemm+D4DqX6/De/mlKKjsh+JA1+hlo14xYDbpCRXqA
	5pbBveGyoulNVrunTw=
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr296577985e9.17.1791914992608;
        Tue, 13 Oct 2026 11:09:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:52 -0700 (PDT)
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
Subject: [PATCH v3 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Tue, 13 Oct 2026 21:09:33 +0300
Message-ID: <20261013180933.487013-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
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
index 9b8eb8df220a7..6f19b19f694fd 100644
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

