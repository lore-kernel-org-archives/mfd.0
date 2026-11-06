Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993577;
	b=TKbK7ZEo3bRJsjp96l1Q1FPQNNYCZkvJB/jhrhi3YcLmNXl/Fsfcaj59lHYImCM4NKe1
	 6dy0q50q/OP9k1XIACE1/uW2GY+mUE5YnTfb1quiuaJSGZXicy7i/85l/e0tlPfGees7C
	 tXt4/iGtwxdt96lLbqSOE0l+T+ex3TPsXqQN86S358ozhd50CngVGcyTbEi5YDhgGnr6d
	 /20k6V1KSpImSbZY6h6TqtvIIGdGR6m6mEYjGVcC7NU7ROTcfcWOV03ygaoppyTNKjUpP
	 pbCb/cYnDifD/HekttaNsESCARjAUsYIqiPl+8DD3X4iU92egstn43UtSFlCDb0oJMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
	b=saybQdB3fALKYUmYQ7bVyfxzpza74hVsZ/lHx2mUYaiPY0WVYOifNq8JWKyJzVi2D0Da
	 EWfNFFOR5SdE6703Oq+uJiB6BpldRW7eqdEqCKgHbcms4en2htLbNPp8e3cpbzsKvIHLw
	 1gFqQw86do9dE52IYzAfk8TqiBze6fIBJrB047bMxyhM+C3qyPwmhNC9SEAR1A2mHieJx
	 7EwZmHeH9wm7lBiKUuTkJbxXk4Wns4PH0UfU8q9OFhpziwvbrQ52xrR5NDvXuNUetZj6o
	 yguXDPdse5p3oVdeUTJv2WWgvLZmKejfFR1UpW1HDGki2Bh0ONhoMdVDEYktdevyWbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DLgHzuRA;
	arc=none smtp.remote-ip=209.85.167.69
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB937606D805
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 19:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB937606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DLgHzuRA
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5be48f8ead6so521234e87.1
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993575; x=1794598375; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
        b=DLgHzuRAGcygIGwCYn4wsa11ZgFz5bChHHOX89apLMvC243DpoXKss3TVdXDc7vGXv
         a1Bu/mB6ifiIKr2d3NnLKJwmeUgm+Ftg3AB/qhwi4VVaxF3bTjq5b7u2Ze3kPPyAUQOJ
         1pu1fnWo0OgNfnGSaIbSOWKiLTZtW1NZyXMYjBrvjKKFSSSPP00B8ROoW2DyrU1pTAUR
         vUz/tNhopCbUA7Y98ZAOokpn/HwnO6UkjGdyU7OxZ0hihU6YZT38VjZTp33pmYUVVUKo
         B0lC13J4YDrWM9GYQ+xiUD/RGuUSwoiVUKCghEgwMSgtTX+CJgff90H4lK4lYg0V4B1r
         2DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993575; x=1794598375;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
        b=ALGJsBYux5jv5enKe/PEKdWA1FHAdIPqGrWxMGGU+4HXRyjPF6xvfhbAHatoBbKxuv
         ba1RMUw3DfLLekpZL/1ncEA4R+9eHEOIz7ryLaRVpPt/JCZhF5SbIJJn+qVhvfGop1Tw
         wsl8DULvAsZ5ZoyzFv3OUD09/zorBI/sfnSJ5CIYB2DHVt1WRshwMDHS+VzLNtU+cjrW
         u8jlULMQR9J671YqpX7fJb0cAw4VF7PGvVc78Bq4N5jPjgmxzYn9l21GRyU1NojFG31A
         ec1uTDIPUXO4L8SZt7gjk2w36a846AefUk55YkJ0RzjFlIGEf8focJq08ysyI74G91wV
         YuKA==
X-Forwarded-Encrypted: i=1; AL+hErH32WgdC9H1HUO9tmZ3SUeGAP8Nvp4A+OoJnaA/YuTkUNTX5//PMm8mK1a7hd/k7vO0a2s=@lists.linux.dev
X-Gm-Message-State: APuU4Z8jn42aMahjdo85xwn/013+vYlWkr/9qxEotEaKAih2tqO02lGh
	TGxAekR5j3+rGuEgj/2zUPP4g7sz+AIHi0qTQ7wkAol2ylwrauxMayqQINX2w6T/NWaWiHvCYJQ
	CurvtQQpPvg==
X-Received: from lfyy9-n1.prod.google.com ([2002:a05:6512:609:10b0:5bf:f63a:785d])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:ac2:4c4c:0:b0:5bf:c9c7:eae2
 with SMTP id 2adb3069b0e04-5c003c595e7mr1028653e87.66.1793993574941; Fri, 06
 Nov 2026 11:32:54 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:17 +0000
In-Reply-To: <20261106193129.43493-1-dbalint@google.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-4-dbalint@google.com>
Subject: [PATCH v1 3/3] mfd: cros_ec: load cros_ec_pwrmon on supported ECs
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
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
2.56.0.455.g6c5a503b38-goog

