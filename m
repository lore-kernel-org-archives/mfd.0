Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989804;
	b=kGBKdRH9rtA5/C52AoD05h2+LRh56Yag292hre85vDa/PewBlXKCDmoCtbZI06lYEU8h
	 DpJaPU20P4itlwFEAZ/DMdkdU+dMWFZfqhWqli0D+1qvad6prRUH6b6RTztxocNpzczzr
	 5FuQ0fzpBBW7I804JBNxh9DlhfkwftSv7OZtgrhjusBdIGV6GzBh40HNoOdhYSqcqDKar
	 B6uvg7hpCOl0FrUW4EPGyynT9lSF7xD3ECcPrhHxOFmtzWEbp6fzqRkfAbFLsSbi4wWlb
	 CT/Q95u6y+wyDzelRr2tCDHUs3DDRIjn4ERBfvKuH0hz5jRxXqLmYYV8PUofWZJPEqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZKY+qSfDmcc0hHBDLXPOUnxktprMn1RL6HXqKZAm1Tw=;
	b=OaiMILsLV5j86QznohbHH6lIo3gtV9V1ygGNGDoJAClPaTBsHVRj/avx6rUU89Zr70NN
	 LYTdczwonbg3mcpgMkupk+y2L6dqQIKjf1VmNLJ4nWOiwBphGjhiKPrYamoK5M7vyX8j9
	 yVCYDXNtNFkmraRntewSNGvCscoLGOURjwqTapWkATwr1yJv/ve4ywdzx9dYtDprw5mqT
	 GKc0Cq/gdp/AOW6nlESdJwnTgm62BGKlcTzFFKjb+SgA5Q+0+YMtJTDaPqBel7RDd2ZDf
	 ovBaSfwNvZZ3GzZCY/VbOOAMUVej1PuPh6uGiZA9DFtfZ5apLzml+tCB4FBVCSYjusw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIcpGfMq;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45677606A8BD
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45677606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIcpGfMq
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-886e61fa30fso320138b3a.1
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989804; x=1795594604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKY+qSfDmcc0hHBDLXPOUnxktprMn1RL6HXqKZAm1Tw=;
        b=zIcpGfMqsLdQDse6rFBMstvDfFIiGhHOc5WPkGC3Ie3uRQ9dQfzU1TatkYcgxMgDuw
         1f/RH/ewJIttAjlSTpYAXVt6oqQAPGA/B/4scvawo8kJCpKNU4XfLtgEXo3Ui4pL1mEW
         pBw9impp8AN2Nedth15JarsGqkV2nLmPbjMASeboawOj/pkqnTd2WeUbwY/0pSxEZ2TB
         r/vFxR85Nb09J7pl6l0wJRe3fSO9d6SHx7MS0WlYQCKoXb9gXnXXhzLIsScgOcGYkwwn
         VhIKhXPaLrlLm/q5t1fRnOp3tFNM13UjXhdB/dn0t/vv/Rh0M62b7f9PJnjH3zxNO4c5
         XoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989804; x=1795594604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKY+qSfDmcc0hHBDLXPOUnxktprMn1RL6HXqKZAm1Tw=;
        b=HtOlpVLrvo4dGh/MKrZt8OxzvL80FWtzUAfYxoV0vmP0b2k4ACqKEttoPQ9dFlp9ua
         2o+UpxQiYDrBltRrCuZv9B5UaXDdCv7pHMx0AR1Icb3T1kvRuBlnQ45flv62CChqq1rJ
         ot3uYRqVrvCs/HrP+aoxMzJQqoj8NeZJP1SS7v2SyKskOv7Eb33bPMAN4cS/OtSGZB68
         N/+cecaULpeSCOEdf6p3v6ZyHZTDK59fbcMXJQYnlSoILW4PzsuKd39gAxZ0i4bWYi0U
         QAmL7dm2Ur/tTYm4XwOPOnSB0/N4Hx0ZGLuhZk2LOwfuQQ4pO8MqL8G7YX9uVdGp05rT
         oCyg==
X-Forwarded-Encrypted: i=1; AL+hErGZPFYzcoQ7d9FHwUQkJCFBri1yjRhKl4J0IBXFtCy6fEdKkXZzGfUmfJBOyu9CcDpB1Rg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Jt42pOxC/PeNE/MGgCv3iPcgqpfHFkPzTEwc35XCeJ+7d2jAa
	nR6I5+Sjb92dLqh475Y/Ii2K26qOIJDVo0DL0Yvf4cPt4hbNRXG0ciW2
X-Gm-Gg: AYBFou3lmrZnn+OSAJRV7CK1OGUpmwT1NfWfbOEfjoOuuda4ZwDpDdDARQdu9kfPQS+
	XFxkYxAvoevprfT/xfP0lV7SOb1vLghiqubRdNYK0rrhKokTl/+6+qVSSqOcBrrIUkpPanOOGhy
	qEogSjNa/BjtEZ+AGVgc3hEsFiuPCPje77FitDEmSzifRLE0vtppBA1NLa0KdacoSIObF12MqYw
	adHUMjNjch2tNBhcy/pCUNlYn238uD+YaTu8udfpNGm8s3MmyxmO+tSigd/DhUt7UEmiPWD4e7W
	wKxwGa388eoithuuoYiQPaDGwka8ssB5LgHCfl6VMfH4ZMEUAtr3lqgP3D1ZbOY40yrxSQt+i8A
	fK9b0/9Ai49+usq1ph2sojejoO4toFivkWJYecRxsDEdoJXR7MDRIgwiR6W3Zxj7lQmGXNrXDVr
	O+jhhwmeTrCCaqBKUT4zPVQ2c0qxVvwe0D0ARt3L6oxL/MIlVRCF8L4yIQqmszIDwWqBuzZBk5a
	wk6sPyrwtS+9d/vhvzhoVIXcw2DTQoZF1eqJ3skrH7BqiVeV3kQe/qc9ND5HWatJ1NRAG8af4oN
	zsIJDUZB2ViHVo4jAt996gPRGTO4891H8w6fRHfP8xfCg4lFwFEIxf4zdCoiq8C+r+r575Mc
X-Received: by 2002:a05:6a21:8210:b0:3e2:9b5:b167 with SMTP id adf61e73a8af0-3fe8b3fc613mr2098585637.58.1794989803523;
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v10 03/13] mfd: nct6694: Ignore interrupts without a mapping
Date: Wed, 18 Nov 2026 16:16:14 +0800
Message-Id: <20261118081625.2399247-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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

From: Ming Yu <a0282524688@gmail.com>

The return value of irq_find_mapping() is passed straight to
generic_handle_irq_safe(). If the device reports a hardware interrupt
that has no mapping, irq_find_mapping() returns 0 and the handler of
the system's IRQ 0 is invoked instead.

Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
interrupts.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- New patch. Use generic_handle_domain_irq_safe() so that unmapped
  interrupts are ignored.

 drivers/mfd/nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 8d5a6f6a7143..048de767e543 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -227,7 +227,7 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		generic_handle_domain_irq_safe(nct6694->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
-- 
2.34.1

