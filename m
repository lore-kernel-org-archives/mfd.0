Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619AC41C302
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037095; cv=none; b=L36R3gGr91q2e77vTsoz4h5NwOVFRacgewxDHeZU9Zi35qj/2p+CeKi36ROOYvabU3FyfxEBL8XhVwFhb+8GYBAGs4Rr0Own6dFTq6ClPVQGF+hLkEtNbQc9cPoHdaPsEa4nSYHFh0ZuoelAfGrosQWRj0RX/W14dtTVPEcJuDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037095; c=relaxed/simple;
	bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVHwPBZNCho4MsWp7HCWaEx6BxmYgEmaDxLiXgKybVje+pOYUMhMyYkMLeXR2m9Z59ZyY1CF5pNdA8hmlwtrrjW6Z/d/XtCtHxDfv5IrWpY6fJBKtkp8GdWnMv+/soVMmasMX5GnT8pn4rS6Kur4YNCnIMXhs0scUsDp7Vc0x70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z0o4bIk7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z0o4bIk7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4858303de5dso8106701f8f.2
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789037087; x=1789641887; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=Z0o4bIk7fZTF4XxagPFXDT9HsWqd7vtTqrNBdLlNS3ZvMNHToV19dMx31BDTNDDj65
         Lb5iOoY74xvmGv2Sngpv6Y2JYntbrjcPAcO39AkMll/nVYFDpgaRET0zenzlTUMTdBhO
         pXfhaZw8+wBth2SLOMgoK+UrJ8S+HXaRUf4+hgTaqkGeV3Hhd9yIuJbYFWsMpIdoRbDG
         TtYtEGJZAJdx8LeTh3NSKVlmk0Z5qodQXXkOT4C7i2i2xNiF/mddeKvH77D5eLccNrYv
         jj7iG3Le7o8qwfZm/uxyg7/HvYGYrenzzt8F+1jayEzQs1PZ8AlVXnoPxs1bVAbwtntZ
         qLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037087; x=1789641887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=gzJ+P4IkdIEbaVnsE6CKI9LpGsbG9u3pFGvsgzIL5KpSjiSrAfTEdn32Qsfe2KbA8E
         EUhXxgHRi+zb076oe0kjxER54ZFHHyijNJiogbGe7cZhd/ocsaJsY5w1yPjzNv2V4j/6
         RgCdx4thhMGWJ0ish4yAFauSYNasrcFmpUcAnIhmAm2eLyOJg5XyaPdglgKYEuCdGvaZ
         z32oZyvLpCJwrsB/SEOQ1X+e4JpqB/YuTDgHjXNJU42IEzinnnsXjRbFsMiP5QWOhbIJ
         SEjn1O30zqsf1rYwocxCarwtCBvvQeYOBetGT9K5NAyt4YKOlwSKEuEHKs1zPP+Ii5Du
         m+dg==
X-Forwarded-Encrypted: i=1; AKwUvBxgHjzecXhUXlTlMEbgntncGZZzK87q4YuGID6S17PFpn7OMNLeCV88G03SwpkTcdMzTzg=@lists.linux.dev
X-Gm-Message-State: AFuF++mBlCTK2Q8urzJXZL4oye6mrrBhxzycTzhBR2w2c0OrAtT0l3Sk
	Q5oqhXU83xnzklLomBarYzcQtIF9YMb3BHdL+07YcsV8AmTA0YBjsYtXDURHk2Lki+M=
X-Gm-Gg: AYBFou1oZpAEH7xG8PzRyadGR70n1Jvc9ZagaOnKBHC41S4TOIyoeE2AH3vnhtFXGel
	PIeCuJXaLnacSMl1/WE+W0Gs/SMy4blu0LDpKT3h1ZyQbQ5w6CoJsyiz8QpEXE7f16KpYOhh6XX
	enpJmAzHeTV1aIpZGK9h195sF6yLth+THPEZY/KqlpO42igrvEYa9aqF/xfZ0ekSifc7j3Zu+WF
	A896/3ngLk1RxepMvjdpvf1zgYhl1CR1ZPeArzX1cj9OxJ/cPVgjSKjnU1Up7aupEjQTY/8m/Dn
	D6JahdDVsFgH2HZtm8anM8tvNIUGNum+fSerqmCErZzIrJooMgNzTBGLxTtzN5xxaQFhK7t76tR
	ty7Zfdw4NmMKNZTOW8aW/EM7D7GkkJJlJcc6zwq4rk2OX9Nj+7CfXwKRuxV8JnetMfV3hGyjevM
	G3BRIUWcVkerIg4fdF7LL0umTpzT0VLxEHkC92zBY6wZ+Xlv3RU4YXfu10lzrUFlVy3IzjOvnLY
	1ApTVKNH7tYEzv+69sIuOG31vay
X-Received: by 2002:a05:6000:4208:b0:485:b14f:ec4a with SMTP id ffacd0b85a97d-485b14fed77mr7249343f8f.31.1789037087270;
        Thu, 10 Sep 2026 03:44:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm49704577f8f.14.2026.09.10.03.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:44:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 12:44:35 +0200
Subject: [PATCH v8 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v8-1-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqoooW3XYdrGA3KXtzcIR+JsuUVh9ymx6dcnVt/
 3lMv7hoH7qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKKFgAKCRDm/A8cN/La
 hT/nEACAUvPFNOyTux9/TqLqgaGtiABfBVtMqJII4GxR7MUjAI9HuWXyDKHYmwU/DD80jc0vNYR
 +TNIfEDACQsGNbmw2OEbBnHMcHJy1LRHRwYerIeV6Kf6mdqADJBGE1vZ/VmrHJGc7hU/5djRNJc
 3WT7Q83Vaqp+dlI/0Jayk+vn/z/j9TyRZj06rnoFJx5kkCo2hhP7Wf5PDTdsuoUfpao6RX1kUX3
 0sC+iYR86a5aL5PX5/xfWV3qlmJKfNI21T959srQs8/QAKVDUEV/K97fkidL0ugo5v3+ZQnI4ga
 /h5395TZEY0INuitubtV4wt7v91lK7l3hBHju/XpYngXuKZa03tSQGWr0uNi01Y08KL2SnP1pz8
 LdXKx1fo1zx0ocRbDue1nPnylVFyODT6EPJ0ntiJWtJ22h6IoguCeed+29FsoXHVBWstGAqRFYS
 M/hE8JjHeDf1y5SXu2AyMo/y8ElK4Q7G2/7cASfl+4oYT8QTnJGHzXuH61vf973ugr6A3iFVqdQ
 1a1F0Usdjf49WBJIEdP36gou6wA0hxkmPVHZzvn85B6jRA0afDjITcYnLLiYZ0e9vVNQJq4Ne4E
 4FWxx8ED7tr57+avcAz3HzFUQJ0/Ljh1yMtYjRQdrw1WyQvgLMxKTJ59E492NQmSYCaZ1l611bs
 ySxSuvDzhQB9fzg==
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

