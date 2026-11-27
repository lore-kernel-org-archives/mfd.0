Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775871;
	b=236NYRRmHdXoh8pK/6G7DMrb+obs7yHicUHNX/iEN3JNorJH46j6cj2k9gDGXRymDeQp
	 auMihJoJ32okp2eHkFOaMZI38Iwyz7H4LLgMyHK1QlPLAOZincLLWen4FWOq/Q+elMmFZ
	 6pFirIZhFPnSnXf9o+rvgoDHJJ/JlQF9kAkXptw6n43+UpEwnyb+XMQeEyV4k1Pck+w9A
	 AzcP/LIWLmmiBYHF1VD/5OR4vZX5/EJuBheSGmIMbMEetfVp3c0tKBezviQlhBsOouR8C
	 vwk1WykquqWTTilXxzJiSoGQgc64fBST0r3MgVGJih/5FWviSBwxb3cOYRVmXzlCSyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
	b=3PS8TpOlg531foDBC68jU4G3Y4kC3fnTx24RDkkn01SQH3jezAwVFjFjxG8OQoiqL052
	 doYlYeXZe9ci6B7tG/FjfhSLuqzKGR/+TMRuUfcts9Mmr1ZSl0I5KGOihy8v8KKfGiBDl
	 O4xnbxdkXSAefgepw0mE81/O/gH/Yw1gAov+QRVRAxQ91mr2RmpwU6mXxo8GylCBTiqr5
	 2cc5wI8JdnSeYvZ2apUWQVuNmyQOY1iTL0eqCqA8aIz9QRG3MW3fs0J01QQ49fcquyB5W
	 arLDGfN6CtYUBPatjf+rEp4z2TTuI0Tcnti7gBFTHmPbUob/SLUls4bIlL8RqCy2WKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kIYtpB5D;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D544D606A32F
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D544D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kIYtpB5D
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491846221ffso6975306f8f.3
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775869; x=1796380669; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=kIYtpB5DQfudLes7OCgdhQyppbAyVgiHkMOGYGRrZ/Z5KuNunSelJjitmuU1XCy1fh
         nuRqV9UvCJmPVML79NKEtvT8xRY4Iuq338JywVSPJOMlafDouE9pSXEkcgkUMICTwDOt
         HX86lqe17fzLCZRJLXoUI8jee0jVUGqyl7uOVLnfXXuZ9VBVQi/lg95OFIhksn7/frwt
         ORKWQdEBHP13o5tbB9fnElCWIuNizfl9iWELuJiljjd+wH/jgDnhCA8vJyemsf0bKMwc
         dw6gl8rmqMzOhQopvQXNK9K9wDlVrDi+Ttc0jGuO3xAtF8LsZa/+PbDxoe7x/FHRLI7A
         ij5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775869; x=1796380669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=BRfy0yVXrH//WIbPgLTwjMcSti3Ublk0l7A+NnuI3Tfuv1LdsRxXkso2QbxtMLgVcu
         wd/KAloKHvHGHlFcJVdiYLmsPYYlu/KZUryCDRwNQibrySWD18gUK5DLQefuxkrnz9TO
         n1XFSGthUfKXrwXg54AsMGOzQF/ugStp9vvLKMKlRuPsAHM7b78FhHHuxEO8gKv3xnhV
         u+mrRVejEbcMirPm8E+DPU5qKoXHzDOxuFznk73k6qWNgA575R6WgZvnvO0OhT7PYokn
         gdERrdUjr6q44t9/iNnH0e2emLXj2tye5fx0Dz4+uuFfqCtFuBCq3zoLVugH/QVijytW
         aYoA==
X-Forwarded-Encrypted: i=1; AL+hErGTeA6g/WiUs784aWgo0aqg5M32EQiz15bVnwd38lgIogEQnUKzHmoBr3rKUIDMyMIy0dE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+VFN60ANxDqvG+WFPcB7IlaLztYPUJEi69PnXIs0aqoI1XI/nP
	I4gAuEXNds597pkKJY3226oYUPAXPvWA0RpKhgOOvU2kVKhsBB3ZcINE0wHfjAXbQww=
X-Gm-Gg: AZFdTZdUxGVfcF6Z7224nOS6Kt1KSb1e7LZV7nbdBI3M6aWewR3jl3hG6I0Jkamxutm
	DSZbSJ6ghJjLrdoZihGR3jAvuDaN8H8API8E/AGq/IteNxO5OSKiMCNw5hAh1tp1cCUGKQndewl
	I/a07STOLYDtuqr0Hvgvu+JRvdGWPx7POjXQBxGMovgdHmblacGIGkeIYO6KMPE2tV/EpRmaMlo
	rseXHQy62haxBBitjrAh2I5f3Zpoixuu1E7k+bTYTYyANuimvoZleVJkf3sQyvCMtVWrShGdGMs
	S7wC/gIKGIWRdqf/ltex4KufK006lRshilJujJeB2y+e8AE59lGaR4Jf81+ikeU7PfXZVQl5DZh
	3R+QWvnzFRi+N3wZKQi5OBqZtqBwe4kpfqKWwbaQ8LUdM+gpqW8fxEBHrF/L5ZHd25Js7wSZeRV
	GQX/ZotX893BOXtZdOHD3A9/ktDlhTllwts8h832K/L8SAPjvEvkVLRk4+mMW1bXNQf9WrTWunZ
	PQbdrVzKSw0XHIeOeVxk201lel2nS2W6msYjazBGobSXHVLLjPb4KxV8leHxt8JtUf1M4pxH4+r
	649JBwAOzKU31b3cxXBTMMX4LcBD8nLdgFpupsT0wYi+KqIr
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr45494272f8f.0.1795775869247;
        Fri, 27 Nov 2026 02:37:49 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm46609111f8f.52.2026.11.27.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:35 +0100
Subject: [PATCH v9 1/5] mfd: axp20x: Constify axp313 and axp717 cells
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-1-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVXV028an1ofFvHFk/HpnXt3P/fsXev2zlxZ7dUOs
 YDPi3be6ChlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEpDsYGbpu7Tj6oM/doVbn
 wJWN++XbV5faN6q1Tf69ot74o8uVjl2MDEsLpQ6s/sLV+Ul2e+2vLXk1B77N2KWs9aElb5o7a+2
 ++xwA
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

