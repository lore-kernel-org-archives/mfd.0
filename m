Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34787442139
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509422; cv=none; b=eqpa5p4djeo9a9tZvoh+PrAb0plGy4AevlD2BILitemF9RKqSAcD3QqWsAGlsGGzbISic7LGM6aQ68Jgt7AmVxrabUPS2OgHjraGLicD45b1iDmgWlWbNhLmqK1OVjb1kIWvwxaLiAzsCVR1Xsr09EE23LsA20eIh8l6RXXT8Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509422; c=relaxed/simple;
	bh=5Z3Kjl/qu9frpgrxoaG1cnOIH3FkXrIBBkNKOC5hW3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAS/eQMlXsAR2/ZpHPeK4BeAR2vGZjOWxvyt9Lv6MFmuAaSZGHyGfzAtP2nZ42LP0sO2buzAIh2DrAzKGA2UZ+MecpdgSprdJ46jvIE9YfgFNjrGBU6LOdau0SV/mzWx8yTDm5prmNwkUXHk7IATaxaTgYFcaOAXIH4rpP7Wqd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dlENxCBf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dlENxCBf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so3014285e9.1
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509417; x=1784114217; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TFkb3R/mOGWcRcL3Ri0plY/8Hyf0vzpp7+I4ubysSE=;
        b=dlENxCBf1LoTfNRw98C2aHv7peQ93kMhvN/dTFdn2gVhj+Q1xxBRDsPgmmIv37YYI6
         W0Gk0wAiPAl5EEasFBa3aNO8mmlUS7bCWNrsySaqfslCyBulHdieMpudxAt1U/0flNwD
         0bXOyzBk9HcIFjDe9OjFAG0Bd6wYo5C6sh36J6EqvKkmzRmMLYM+WDTKb0wBXFL0RTCn
         nFNBBuhxqGx1TLbdcCyZDXszsaYZOuzDTlIS3/uciD0DU0CCyTYkUGniBSPtV2ad9q1h
         bt4mnj2wkDMMfZcGCBwyJ/CQV0ZnCFVbNy2TT0AqignpOsurLBJEgp7huevxuMvXy8Y2
         xNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509417; x=1784114217;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TFkb3R/mOGWcRcL3Ri0plY/8Hyf0vzpp7+I4ubysSE=;
        b=cO1K/QhtP9uYSrVnzYBfmEwoaRH+lLU9zhvRGfWI3NSOXMkpEfF0bKq2hLYdLnMyKB
         4B7k6L+DKV9hb3oUEwUfFsqbGEqzXnq/94mEKqpMOc7/GhQ3BhaY0gG1tZAMg0EU3+8h
         dztKuob6ISE3R4kyOOrDucSrpjnGbZFyAHQQ52ai7HADLcnzASnfFBBauWpdkhg/Fa7d
         ZV8kR5DlYtjjqjHuH7rQb5qLDNmTF0ggqHt3SvzfReEfCBEPJUKLIsQ9b6hrpKyL2seZ
         vykiHPOtVRcWkhXjv2YQkiE7A+nlHb/8/JBttdmdoxMkeb8ZnlxR3GhZLNh95rAEYNOk
         ksgA==
X-Forwarded-Encrypted: i=1; AHgh+RqS1cN0AGWKIar32xjMumEXYwncAQ4OmYpLihBF3n6fcbH1aZxzEMkQEKZlAqMEg1/veTY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF0eFzSee94SP+uoworA/TB4fQsJCg5HG89Dzq+faq2CeAtQa8
	uUjv9Ued4MuqV6l4ecX4kai/iGMQ7q1ymxnajfQbmLnb7iqzuAD9yt+Xsez4+q2QPyU=
X-Gm-Gg: AfdE7clBTY80Rcg1Ufvs0CEd0nbCbXf0hpgku9aGcy2zFGH38knFkAvXly/9HRLu8Au
	Eg1JXuhM0jd3Y2FheHEQslL9+CSUnyAov3OhDr0V5EpKFVWpsmU/Ml71k3HK8huIcSbRus3EvcT
	0SXOAmdkWtKAUptBNxIcg07S2YtdAw/usZgapqkXtoA+RAYDyYOKllDqe+s/+a5D1m0Ynbbuuuq
	Kyn3r152Rn39x/Xm8SsfCNRh2JTZNGdeJwe1QshqMQYsSkRrwtR3MRSogEerBWz2Q6sdxPYNc9N
	pI6MyASKfnWPDngIvG/jR1Ezqu32vTPVGmICbgBue6n8vasxnHQyIheeblngskYr4ilg2RYX4cI
	0FUKuZYOGHogGDjaqF73cMAlxQ6b0jbfj8fHu6z4TmwK+BMap5D2Cyt5/0s9BtfE5VA4uWdnqKe
	I/ua8i4QxSuwugrx/UdPGCleRYCkT1ipz6CBMOJwrcaPT+2OKsfxW+TGjUWi7yAFSFsyF5Zegd7
	lCw
X-Received: by 2002:a05:600c:6206:b0:493:a573:179b with SMTP id 5b1f17b1804b1-493e68d145dmr21897535e9.30.1783509417027;
        Wed, 08 Jul 2026 04:16:57 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e610532fsm45146255e9.0.2026.07.08.04.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/23] mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array
Date: Wed,  8 Jul 2026 13:15:19 +0200
Message-ID:  <604eb0616b7a3b466808ab6d947a0cd939effddc.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5Z3Kjl/qu9frpgrxoaG1cnOIH3FkXrIBBkNKOC5hW3c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFiR1Kdr7/P0mx+7jGtlAq/11iIR+rantr0o rNM+wvtZrqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xYgAKCRCPgPtYfRL+ Tga1CACjD+PzrRVnBybA/5GlhM4ZKtClAX1rTaK+/OYkxY4Ni7RdzFQu9Vr721frLxvCTbkpM9K AvhCZlK6hDVStsmON8g/kRt8MR5RQwSNCtqoXjOCfeiNHNNlgRjBqmYfs7ZqmRWhTAqka5aEMqP 76QQ1AiV+F4Wxun1rMiXL6vBYyLejIQyd8NEsHfdT2uVomtuaTiTzop2Xti7HthiC2GGGkw2Lva BNvRF5hMdEkMndWVx4LvB53VyzVhaXppWUoN3BL/VNoRX5vRuWVKMACKNBAy91npNTbUBHqVgu2 +axrLctzXX2oUEDx0CBUhIFuUmsbQJC51IxbooNpkwNALWX6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
dfl_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index d213c6ec04ba..f78309bbabfd 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -434,7 +434,7 @@ static void m10bmc_pmci_remove(struct dfl_device *ddev)
 #define FME_FEATURE_ID_M10BMC_PMCI	0x12
 
 static const struct dfl_device_id m10bmc_pmci_ids[] = {
-	{ FME_ID, FME_FEATURE_ID_M10BMC_PMCI },
+	{ .type = FME_ID, .feature_id = FME_FEATURE_ID_M10BMC_PMCI },
 	{ }
 };
 MODULE_DEVICE_TABLE(dfl, m10bmc_pmci_ids);
-- 
2.55.0.11.g153666a7d9bb

