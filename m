Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF653FF89F
	for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 21:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570259; cv=none; b=T/qjps8k+fO5wQyO/vd1EXeol+KhD3qWVkrmVIbFqC36POIqfd3uKMsvQB2K7WZ+xCDmklsEWIC8sS071Znv/n+XfHCkbOTjgcdtGZPi6EtdYms/gxRhSnfkvnAKuOVJlqU70Mnpl8WO+qnzCL4mahRRhZ3AqJUAVzydyUyGnWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570259; c=relaxed/simple;
	bh=ZauFLZdTU+txgWmmv356NEPEzXfMT8LD2hrE87LiP44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MW1iuQ9fGNEPtjapuBI9JIGgRLytYXiC4Iu7b7C/9KlsqBo5LgJyDpQFv+SBOxymcadm5ImdGqrdc+geQJuHPZ4ENwdCz3fMwmPV/OhUj2j32Fq6UmDvCc3VVIu8asKuxZotXybi4rzS4hUZDCP9FO3GOjQbNstoJpZXoNaLOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bEJ1wWg2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bEJ1wWg2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49800c6a846so15153155e9.3
        for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 14:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786570256; x=1787175056; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OefaEnBP+Xtfr9MuFwvtjIyVzZPHMg8J6vmP5uhECmY=;
        b=bEJ1wWg2GYKMQhcJWF8NZcb8mbB3N2eYwQdTiXz9ASrVoC1b46VNPb9OQ1DehSHYbS
         Seygd0+ohlALEOUG8qCZJFQ5aCsGv44jOHNg+rk3NwGPzQ35d/97EkLbe7+PjG4Eqxgk
         o6VPZc6bejEDYIUDasHvHEEg1+EqLbhuHL7fAK6E51YuMTz+5I0kpLIYtHEFzqsUB1uT
         7UUJMvZ24lVSBOPv2baTb5JB6ulPGPUMobHwv+NQzULbMaJraZoZpi0qgGScIUMoeV6G
         GFYWXRgMtfqm+FAZ//mc8iFTVFE+C6FwG8UUMYjIIISz9uKl2Ew9TN5mSB0ezFzFq9WX
         bdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570256; x=1787175056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OefaEnBP+Xtfr9MuFwvtjIyVzZPHMg8J6vmP5uhECmY=;
        b=p1kUDwQ8q79ND6JaVduhRr3Fjr42qWPPC4xzmYisL/UmfGJw+21dW32W/caeDxCEr8
         BQVbbvT73Zq9vbRmrqxfXqchyOhAeFBLYXRBiDqSjeuvyO2kB2BVJEDAOYnCzbOVI275
         xT2RKCd/cIRJiEWNVNuj/r5pUT149vb15SLO/68ZxPMjiu5DO2DOsdmNkejpfDm19tPF
         uAU2IZph4WZryNpBpT9darjMPkiKCVdGMrdpPUw1hdOlED7SbxWzhR4pkzp/iVB+A5dX
         RrqV0Ks8oVdEP0+dYA7N750/sYRutfT378pzMZh8f8XZUZImHb1rb33YAiSpQIL3VPck
         ud6g==
X-Forwarded-Encrypted: i=1; AHgh+RoAMhNLWUKlIWfjrxrs7ECEMedyn2aziFlvXLcU6V7Y/6QgZY5VdWgGh2HDn+WpWIbIe5E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSdw3hLJe6IsOzUkhMI56HE1walpV/TCzU+2F9NfVxezhfAzSH
	XNa8Bx9VGsjiquAzU+lwpta6qvwhrMafvdP4+OSHzN5Tp4dMtaPgKzT0XimDazR1Eyk=
X-Gm-Gg: AR+sD11JVkhpaU80hZeNU1oHKx7D84N6M7Ol6+PzJv2/OrumDJCrFpcVolR+ST+jWHU
	8VQnEmn2DOOSGs8oZXkDDK7uzWeIrvHcxNnxqoDzk/DFvZt14GENwQIlkjRvjOtpPZJai7sy5Qc
	iDi3DWh5NiFBylHbwsJLQ2XXIs1OM+XHLyNZr8g/e2M9kgqfRH0I3IJVu6AQybD8yvAjZo9yxPT
	6TseuOU6zRd1uUc42WneFIpVAe4Gs24GXa5kFG36jh5nt6rzEaNTsduIPBbu77mKF3kcRVLh2QF
	xVJYWgy78IeovXnq2yFHVHQo/ShTUzr85SuGAXk6u+fdQ36tYzz/mGkMc2uQe3N/1F1yFDmBROn
	1XtE6KUOZBotFJomtg2H/SGqtQqNfyKcat8HiPJPGAgU340h2q5IkNxZqticAbYLIPhHvyzqw9N
	UjAH7ZO/tt1uNDvfLRqRUkg+1udTqrAWrDX3cH/9XIntwnnbI+ry2qfKef5uk=
X-Received: by 2002:a05:600c:310e:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499821881d3mr6458585e9.1.1786570256121;
        Wed, 12 Aug 2026 14:30:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5b6fabsm665009f8f.31.2026.08.12.14.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:30:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Date: Wed, 12 Aug 2026 23:30:39 +0200
Message-ID: <20260812-axp318-regulator-v6-1-d6b84b55c000@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZauFLZdTU+txgWmmv356NEPEzXfMT8LD2hrE87LiP44=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfOJ7z3JPOXfs4Us1c2cB9/AAeP3CY1Ezg1C34
 l1B3hrwpCSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanziewAKCRDm/A8cN/La
 hTUND/47kRYTvrK0p1t/Rk3HhntWINVaH9muZct9+QebiCYZqJbRo/8rcv9meluUuO8DXATwMyV
 8gFSIzRjpaXXpvT/yWmqyP3d+c3s29Q09JmQWEpiN7WH8/dubwUmIEp3lOr7fFcDzc1JirQH0vI
 jK7EX4gFH/r8MUt03NeK9FnBpxqnwFT9ZUS/b9Mlb3+EVQxRxFGjAbAQrUEPTaKmKk1UHpHsLBc
 RWXZlDZsgpwh/GTg5NDzKlv4uNh5DOvQQ7Akn35eJhyg+h0TDd/ZBPCGrx99TzQsI7FvLVdp81j
 JRxomU2g6WcCQ45z/0aeGw1GQFDFh6mDxamuMDHQ6NejbvI0KZa0EN5zuV1cW+NQv2MHQOMF6BJ
 zXkIEIBEFi6/P5ZEYQwci+aWiR3c2LlBo3z0T42572uOFj25d66fvEQEu8BW+fcGehRk6ttORMU
 ATC/styss9CimyiSvVp4hR/XR3/TKvAl6HJOvlIXS+GH/1qk7PZQjoZ2+1DTE/ff2bNya6VRj70
 /YBOXC8TtkoFrvgxZosP8ntTKtmaXB/++zRMPSqAX+pvy1OJQ1hezQSM7nxtaUZ1jojxzqR0LJp
 q+NS/ENacR6/Oc0zR7yEWfopEFv4NZm+KyRCA3HIDVUB2iK3yCfmG3Qmzf/EQkY4VBJCH+7MH2T g9TjSBSn+QxhUoA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

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
index 679364189ea5..22baab6e10fa 100644
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
2.47.3

