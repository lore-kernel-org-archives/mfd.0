Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D76A4D7977
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404592; cv=none; b=srJrRvQtRsmdwxfYwbWF6VRdnRelJlFnl1HUTLKVtpiVdIVBc30BvmMY3OyMGeGoGSq/l5+ZRW03a+PaSW3aD1mOhaa4qJj+n/o5o8kIv0tcXpMwJSW8WerZCx/kvoEcQbnYt7CwK/TQnLucfsIli+AxISuw9aZm684yMewovpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404592; c=relaxed/simple;
	bh=dE+CLRTmP2biIMs5iXmOIJYZyHULbF2+dSHPt4eaWFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZmqbOP0zFL7EkVUm48zR2JTutE+L8umNPqrI5f6P5HsGTqjqTrkEVh/TErMikFLwni6v9Avy5V4wucMzi6iyhROspzSFkPWlCa6CtFfeHtt2nYOuAR1I+Kmnp1Xd87f1THrHoYL9NrUWXLCFHZUsij22HdvEhmFc0Tws6R+/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqgHjo0U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqgHjo0U"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso20124995e9.2
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404588; x=1793009388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=mqgHjo0Uan2Q75pQh1zZS6gWGVC/Q5WIpu4pYqXbszivpvexQWyAIeCSA1DCKjy2+2
         t1DWZhlsx8TjDVeXoBML7t+X5/dWS/NGsrLVbF7zHbHjiX5dGinnAgvDThF9YxuuO0VP
         gqP1t3Of0t2bPz6z8mAt4OeAWW1TrLQGSkjsJHsw39SjlmDKazYjgPnIkMVWiHbtnWVQ
         ukERba1TBRbXdz4w2G/4qA7qaRg+JW0Vehu8Yh9KLzKHssuUCVFxx2VUda/qSdpRbYgG
         Qm6PsKCQAu+tsaUu4qFiMz7guygYsCUn1gEl/6xaSO71rdA7BxD092NgW18OjWYCAJn8
         uskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404588; x=1793009388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOBCTDJ4Zly3dd28/nrymNa+BhMmBCq2pAK/siAAt/A=;
        b=H7Zb2+8liizX/65FEdotPb2ORFSNfHr2OqKstwawa4T7GjokN6HfYPOYo7agZB5sHJ
         BdjSoDgUR8S5zlypw8V6IxnZ/nWVzAEa+qhzUHaAAcCpk5Kzwm91VsdHjdc+ugDGpeSm
         VLf4GMCBX6MLVLvrP/5CbaDq3qajCDb9qyh2d/hyyzjSP7LBc1VE3DJ4qQcmKMhnqdVw
         QwonHU0qw1Eow4Q5gqB5UJ1EgUSF5Gnmmj5wgRJhmTJNv/PQNu2BDKbJuDeDIfbNTM5U
         1O5bs8xvAg5pDl/r5XgJ8034cvFXlW9qFum624eE396H3Jgq+wdXWlhLuZFKf37Fpac1
         uYqw==
X-Forwarded-Encrypted: i=1; AKwUvByfVKXwMCikFaj61XYacT33MktI9EFp16jrwZkp8Gpqt0HeSZbK4cuK5taii3wsdnG5I20=@lists.linux.dev
X-Gm-Message-State: AFq9FYIjDfMhViNKk6aNAcR2jomy+FPezdigJtwDeR+T7xkHur/dUzzj
	ClBI5tX5duxQjfuH/dPA8VGiHH7+eWVUVJw9kln/LxhOR+H4SGR884Ym
X-Gm-Gg: AYBFou3ZzscEibzMwPEWmM2JIh5uc3KMvx2Bh4xX/CbVawQuDjVTBmYyQMPQjrtTBWc
	ocMSwOW1TFOprA6cBccpBSe1u7IFMd/ODUEIdPPU/Ur5gYBw4ZT0SBMskV0VQpc1ayUtSPeLHqj
	+YJjIzkPKD8JFhWUS0jtk6Y60A2vwxV32xA+H60Uu2QNyyKCPm/phhf4xJVOZgOwmIHPNhtvALQ
	qcH/rC60/+Vo+97zLHhCHAN9G4TwOK87wwMLHQ2TExhPSlYBymekoK9bBmHAsd/1rFY02vk8RoB
	7wWstH07XONtPkfQne4uMUoH2WB1JknmjAYyG+kDqLvcfe6RMpAtVbW6XITTkw37Fw9Y8ZHlYhv
	+swZqXvmg9RehRCYNlM2fetXV0LbDiDmepdOQwfp7+2jPJT5SiJi5byKwkbL+ifzlQA2zUgJnms
	H3iEfjgBFKNocXg94XF+7au3466e/4rj8lU5PQWR1ieZUJoYfCYBggeVvmqEKtjlUD1zaQA75Yc
	NYBApVaHjq0dWnEnpTdKf93QVoU7w==
X-Received: by 2002:a05:600c:3e0a:b0:4a1:ef9d:1b68 with SMTP id 5b1f17b1804b1-4a1ef9d1bcemr8412035e9.10.1792404587670;
        Mon, 19 Oct 2026 03:09:47 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:46 -0700 (PDT)
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
Subject: [PATCH v4 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Mon, 19 Oct 2026 13:09:30 +0300
Message-ID: <20261019100930.110954-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
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
index fe43ef675f257..0284c5fa8fb54 100644
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

