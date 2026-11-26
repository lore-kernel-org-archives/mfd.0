Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690122;
	b=0yBFcsxKkzDujy3tzVpazy6hqKKCFVEnzh1PfGN8xqt5P/WAsQT4Y4aMhUA+K6fjPeVZ
	 qgZ4llqgGfROeBLgoz5rkJdr8kY26VH9dqwLgJQzZFmYUQibmgPsCtQQMK4+nLmFK/G/F
	 c+IpE02ikWVRFr+2hd1+n3F70FgI/8R0+aom5Vwq+5aWlKvwL2tLvqF5D0uRnW9draAtR
	 cbbhWB02qRYW7d6T+rWkqTRMh+4uggN+erjEiK41TRRZ0Zn4ldfYfxVyOVTIFYm6U5lZc
	 ReJnFVjgE1FauXk/FarKqQx78sb3Ii6814YyMPTwUaBi1GFfg3cI0IJ+3ZYhXReRbZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
	b=FVBohDXdaB1g5gkqjvg9WpXkSOlwrmFU5z3vfAUOkgUu1SJ+cRyxrcA/DIFJha0hmYdE
	 lQbYVtbcU1qhLx0Krpm5nwgNBAyskLkIzK84veFAdJnuSdHG2edSaqj19BVf1S5slMswd
	 jNGF7lV01P5B7EOR5oUpPsLgC1XMCC4euiJ22Y2VetC2Nsf2fZA0yctRJ4yAxJOAAC44v
	 YJnKNmc2qYcOSLgcaQIMrEHb6filA9mOgPhJ7gHZtJcyEN2kICJRprnMnBHnHgmrsOiHk
	 nkt1x/z5NzPd06WMfbYHO4kV4BwKUH17mzCZNtLAczbnq2cTUy1EGuFhOQSI20zjpuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cZe1s2yQ;
	arc=none smtp.remote-ip=209.85.167.69
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22BD606A338
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A22BD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cZe1s2yQ
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5c1ac2fb380so3161848e87.1
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795690120; x=1796294920; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
        b=cZe1s2yQPRG9hppUHvtHXdSDUO6wgOQj9kU4R0xoozm05ERYfLB3GzLC/2cK+cBtk8
         6ihWeeqTvu2X708Iv8BwOneTDqNIqh2yydqRdQ3pZK9M+D8qfY8ZotIjn/sTzZvtNGAO
         rPGQVqvSanCq780Umca/oBB2p0piBypIZntArMvcMTrL6+Vs+zK7QCI8EdxnP6PrbzsO
         8AbOSv4bOT4LNCtxw6j/AwY50nzBBwujB2mus9WIsYPRP6jHpIglwLIIfm5T8A8sxD7D
         zj4uhTU0auZYq5tH+xMAaP5Ith5KcZfdKAwCff8eRXBLEQ9U3PoOzPIoFPnTV2N/M6Cs
         Sd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690120; x=1796294920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
        b=yt1aVh/46nal3E+Rkn0e0IlrRswzG5At2eFfGFFTA/feO2CJ4YaOrv/28AY6wDsowE
         bgcBK+leMtzsoKTn1G7TcTE7RtXsstHpAsNiDpHcz74jczvB6Aor5vsEQ7Pav+t8n04x
         +fvkSQkR+t7d5Ni5DreMN/kpgqlrW7vZgkz+byWYZRZrfkFOzlZ/iIFGmMRhTbOPQ22O
         bn28QIUHrPYOFrdXkmuYwnvlleaouDoTK9nxLgLF32mtw0KGaRkwMC1EAAnV7yCP/JPL
         4phLR8S55Xf2nW73HCcLBtTA9dHBmk+bnRBGj3GUT/HLkxADA365dUJEtsD63MBs1kZg
         XfFw==
X-Forwarded-Encrypted: i=1; AL+hErGi1ID6pY+4ZOoKSaV9VUmf4F/4k65tOlhy87m15uqKN0HXEEg+FYCF20sbBJWodW3q4bI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/hyaygxMNHC4zswZ7JHFh5fqyBN778pyYekAeiwyJVgyI5PE0
	koLilp93TaV0N4EjzqT78rVhycAGfK7uclzPxvGJ7iKhK2rfjrFWVebTxlHL9kALn1yic6B/Io9
	bFA3PaHrisw==
X-Received: from lfbfe13.prod.google.com ([2002:a05:6512:620d:b0:5be:4c8a:2f0f])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:a819:10b0:5bc:f29b:1a5c
 with SMTP id 2adb3069b0e04-5c1bc7d0b80mr4028854e87.23.1795690119891; Thu, 26
 Nov 2026 02:48:39 -0800 (PST)
Date: Thu, 26 Nov 2026 10:47:57 +0000
In-Reply-To: <20261126104757.2860272-1-dbalint@google.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261126104757.2860272-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126104757.2860272-3-dbalint@google.com>
Subject: [PATCH v2 2/2] mfd: cros_ec: Load cros_ec_pwrmon on supported ECs
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, mfd@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mwojtas@google.com, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Load cros_ec_pwrmon driver when the ChromeOS EC advertises
EC_FEATURE_PWRMON.

Signed-off-by: Daniel Balint <dbalint@google.com>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..9cf85636b7f9 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -115,6 +115,10 @@ static const struct mfd_cell cros_ec_charge_control_cells[] = {
 	{ .name = "cros-charge-control", },
 };
 
+static const struct mfd_cell cros_ec_pwrmon_cells[] = {
+	{ .name = "cros-ec-pwrmon", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -151,6 +155,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_charge_control_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_charge_control_cells),
 	},
+	{
+		.id		= EC_FEATURE_PWRMON,
+		.mfd_cells	= cros_ec_pwrmon_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_pwrmon_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
-- 
2.56.1.839.g22a8290db9-goog

