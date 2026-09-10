Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7623DDB03
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032706; cv=none; b=GW2P28KKGzIJu0GvAx3SNlPDIGnlMlw22dILw76YIkKtHYKKBoMX2dwFSBHOUP/8SjI+AdNrqwmtOUw3ZVTnNQLFlVFR52/9AudD/X5lWKG4NrS963qlFsN0w4spNM4OO5K/2YenWtu2T1uab3Ttprhg0/GP+a4zlGsv95GIuYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032706; c=relaxed/simple;
	bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfN5qPJIas32sYbwPJib8+7Be9c8eaPZBBD1iCMLO6Y3dbpuZa1lE1iaheraYtKuM9UMv3+OD5jtro18h55MMNt1Hx2BCLAP1hV84vgf2/IYC0ww5p2pmOg1WkE6konEW92kSKdbAAVykHbU46pE3W1YE8A7Tji7bXfFj869p24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MKcPClDz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MKcPClDz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e257a23aso4551419f8f.0
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032698; x=1789637498; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=MKcPClDz3SehN3dXWTAe0MsaQpRAZrP9gtvXlIL8ObZos6URhE+jkoeokA0FTgZnUv
         dNVWPDcT3YLua4h1AiToDJivftRnf5rPNeO6Ap+hicKM1Cv3rStn/tNOPpZJgoqzTQWC
         2h5zilUWux+CNQSvVxcLJUF5Aq7Tk8Ob3r5PY00Ej8noWoWgixOQkxQmcaBEXQz04kNw
         Mq/xGgkX4w4f11KYhSMVGVhgFNw2TF7Ypz/lt4NsDV1pxkyvV1OYVJIkFxup2iHcyJCW
         5rdO3dITjWJOO50/tTpFGBqk19sMV1ZTPeVlTKHrwuVq1rdRFzkwfDMwyBJOuoIzux7B
         AJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032698; x=1789637498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=nm7cvvtykrnbVuihfTh7+2kX3vDDwUM5Oi4rgGAtSSAJ6Fqq6DR/qM/7hbeaet1Zcp
         3obwxYViT8XtghJeYQdai7mdGOwk0lHj3+sUINjr7WJUvkQPYllC8CGOVf6AXh1e0Bm/
         THDIWucHb7ewQcgm3kSF0vMP2aOhDICEX7ZfpYZAbYBuHOPi1mEUSTFqB1MFuCBu5zTx
         SdkFlTpfEqL1ZTtpn1QH6jhH/vxotAJL9EWG5apNtv6mtBMg0Ag0xUHfeFj3KN/H8WQe
         3MJsDNp8bGAnYqXUMbaNLwen8zSjeB59Z9SjvdCgJyDfR7BTlQEdh3D4yDyljHZgBZFJ
         dJXA==
X-Forwarded-Encrypted: i=1; AKwUvBzBoh6itvr6VfxEYC1oJdxsKGQJG+4n3TLhWXmWawb/M+OEXCkrDuafK7FKbuSProyDFUQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lXQfjmK8JQXcHdcxVp8zVflpxLvPYIR2btVnYkClb9/35snfdP
	03YwOg4Dk68CmBicE7trb3gOrbhgGGZggNXRri9GKi8eoMA1z5H4P+tp1FPSSqcbD+4=
X-Gm-Gg: AYBFou3BkAn6kcwb8YVRe7PDglSDVMvr+5Yh+4ndOIcQ209My+1YX96An94lhJJ3rRv
	m3fNXX4eU7JkuW4Q1L8zmYh4akfOy2yp+DV0ls1PAnq8M57XjZ2AivekwYVIx5aqKPBpKYGL+2I
	s/XxnrrXi/K6xefMqimuzSKL7t7TDVcU5s+XcSHEo9got7JD0L0Lk6rF3JXWWxvt2FQYke1bu8D
	DWhNPGlhjrxXBZBR/iYRnj+2F1Irca9HFnuGll4REi8ynmZI0hibkF5c2iBwAoPYx0XbX25KYf8
	mHriIx2xTjeHxQBTZrCME5jpad8avqz4+pogTeKg5WDrM0YAtAI0BKCT7fD21SDVPPmPNaauSTB
	7LTmjhzdhKBpznqUO14ZarT7eo6o4T/CaA6ZL2iNouPxP2LrCBIPM27W+iVwQlgVC+9g5harML6
	bq+XN1YmaZWA7cGonzYSkag6ClzitWUKbSeJATcfSE/iuI77nFbdCR3qkwMKLdibtYCILHcPLK0
	4w/evkZEOXwukzN+Szg5g6MLC5d
X-Received: by 2002:a05:6000:491c:b0:486:e727:d4a9 with SMTP id ffacd0b85a97d-486e727d4bamr267531f8f.55.1789032698493;
        Thu, 10 Sep 2026 02:31:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858dd90e1fsm54098918f8f.28.2026.09.10.02.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:08 +0200
Subject: [PATCH v7 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-1-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjuqKxu8UNJHq0DCQAWeUf5/7Y3PNX51fj8j
 RwHioty2leJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ47gAKCRDm/A8cN/La
 hfhdD/9PQSp8YB79F9eYZ31MRivxo7VTk8yHo2WHgTfXaGtRTfjp9JvsSb/KXSnXm1mkXgSDKF/
 1qKGGwWOg2SDh+0/gc195UoHaT7SBPOGUOS7WuyIuXdLAIEURQpsUjuNlmK2aKITGtlSXu7IlfK
 6EZZapEDo5HMn7h07BKKCdaraVW0Dnkw3Q29VHrnU4Vt+2Y1fL4IhwK+mVvjYtrzmwL+Cj89hcn
 8BziLEW2Id7SUD3TNpb/t+kfqdQ507IKS3Zh4y1Sx2zmS/R7MggQQjm5jVmL5KHLM4DTTKIJnLK
 GcdngZL14h1BzQRc6VyJjoD4iJnShD7BkcnFE9LnFq4HdHxP83iC0ki1E28iApVmmD843/Pr+ud
 XyNn5mTkpyjSvMFsUdpJwu/S8/5FpSiHTbHqxM4AXEtmsvHYvraEj0GsTBrUtmduGL2w6ncFW6I
 5gMOWdniEQXZRDBNUR74eBZG5yJKAjHdzl7YWazuo8IyVtcRVgFpKQmZxI7UgLK0MONTR2RSDrE
 q/U03CaNG7XBfU2Y/p+vZWek4zxBiATbJksSPsb6I2bOlURjlc2BPa7YUAD7woYaGVIR8qfxue5
 o2TYBOrh6ODPkxuTU+VwqGvFc3h6K7iq9HL2NdzIFs4SPtpgwW42j/OF5vhkjLuOpjufjyR4Ume
 LVznEVirXAmuMUg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consistent
with the other supported chips

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.53.0

