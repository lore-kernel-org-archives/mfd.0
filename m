Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E743B6EB
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509412; cv=none; b=NjK1C4tpgdLJm+TMtizSBIOPL7EyrLK4X6CItRp8yFad2AhR2Zyz1j3B9lHma1Uxqw6zBfB0yVXjuzv+Q88YM+JZHjLjEat0DvRZQ4aaoWf6wpk5K18dsgCVYVszVvzuO2BrBHDF2QLaN/X8SEfu8nZ+Y9z+IU48EdeFBiyZ9fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509412; c=relaxed/simple;
	bh=XgzeRkwHCtgLE8cDPcpkh+fRSLRZc3sMAzqjruWfXXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iY6I+pAwJ66YqzCzV31S2tX3Vx2srkOYs4IXAiI3KTGIED5N9QiLriVESVdp5aeKrXOr/3KeranHdAlyYtQfocOwNaBtMbCLAmBLfCMxwe90H1jpxSCWfe48YYn5k8+iSnooaNiU4i9OamHo/1lfiEDZzktk9vaQ3h0XlqHRcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bSz4+uEa; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bSz4+uEa"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-474303f3c72so365802f8f.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509406; x=1784114206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CXdimNtV+8iKOc+nx9ux4G2sDnokhnNrrDBoO3UNEo=;
        b=bSz4+uEa56HBYX0AVvlWslUbPNJ3V4sjdSO4eXC9Guz6GBkX6I8z182zTWC0QiuZGR
         NaC+S9tqg/KsB8Jc2jSv4HE7Ft0ri4ED5dFOd2ggH7QfjUmatchp0VdknbmRsP6iOc6S
         v0jmWh446m9xco+F79p/U8vvHMZ2oOEfNCsPerFha8c7M7oPD1nSF8MJyQwpfgEKNGYx
         ptVJkNy8cL0T3l2YNs0Sv7FLhNRYAX7BNJpKs/Px6BA/Sz/IGoWu8+FMcz3wKqmoxB2h
         OfkV2JeI5YSEJ8Qt3lAPQ07SEHrptGnKMlssZlaWSzA1Z5OnbOPIHwh7dipkdo9AilzD
         Bshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509406; x=1784114206;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CXdimNtV+8iKOc+nx9ux4G2sDnokhnNrrDBoO3UNEo=;
        b=VkRsUuGmN/jN9IwEfsayjDJkv05J+k+kb+JK2ZU9NL0iDMPnJliBfChG17bYS9FNUZ
         BPgHu7oqisgEsQLta4CXCPshnZPxrwP1Qjehu0XRo4Ao/KMBpfMvWVVE5OuWTaDyBG2c
         3vhiNDAcOX9lRIIXAg0E1VVAsYUom5Rh0xZ5lMtjGFxgFcWO2txLZx/aWNba1BPoL1NL
         rFKsN6efqeApLW8TwcwMcX0r4fKBQe6d6kedh15lnkCM32VESAWr0ISC+1EkuhARgQOA
         ZxEoAXHJzll6es49Bo6I7YAkqn+FGJuL6XXyludmauanmywRB/K4cT/pZRDR2oIhbBHw
         UENw==
X-Gm-Message-State: AOJu0YzmVoXxLLuQOc1Mqd04mq7hctpb0dQVrVnI8TJIc48FtKWeazsN
	8+TkUMVRLZrGw2Lxc6JOqQ5sYzuMFEqt8MzaP88bTZkrvMVpFWXNtwklFA49Q1qbFJE=
X-Gm-Gg: AfdE7clmEVeA2BXjL/lkr+pl6J8v/GEf7RpLTbyB578u5klAKr1y6lfzCGP2lAEWVbC
	fLoC5p3ij2qz+7f2zlSQJO3YbG4yP9cvktdm99o23MaqpV2bdnDJGnckj6ViRk8H5hGjDiE+Oc4
	IJtyIiuRNQuRiuIQRPAQb3nKZomEkV6Eq9WgAZzP14+UkqpFw95AJ9/Zmi5CO9+N3ZEKLBO2bf2
	XV77eowalLWLG8/bYlb99fCLwnaceF6kpH+O+QyTPDcDarBMEoO0inCuDWFRzuUqgf75+EKUbWl
	8GXyfVbLVcNMiQANkE9WP0dLFEY8SMADVMk6PuoQO/QK6WYEbYhet7OIGOyA3lgXyYiga5lOJTv
	VvnWpi7xgoVx2WO+UPWFup9IrXz+NP7xum31aIuL+y4wavs+NNe9PXbPnwr3qbAi4OU0N0bEJsW
	FQ0kHsBudRZqL9xGPybktg0JpS1wY3ABA9LFgQecItTudeloqhc1IAxqjY3XRwFMfcMFg2i6b2X
	SQ3
X-Received: by 2002:a05:6000:4007:b0:441:1e1e:a050 with SMTP id ffacd0b85a97d-47df07b5c38mr1946499f8f.16.1783509406045;
        Wed, 08 Jul 2026 04:16:46 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0a55be4sm37859697f8f.31.2026.07.08.04.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/23] mfd: rt4831: Drop irrelevant __maybe_unused
Date: Wed,  8 Jul 2026 13:15:13 +0200
Message-ID:  <0cc39229d2521b37b7bcf9b984512284df7c15ac.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=XgzeRkwHCtgLE8cDPcpkh+fRSLRZc3sMAzqjruWfXXc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiw/Qx9bVpfG5HkqLyrY23cp1u5LSe418W1Zmhu5qPdyb 81yWc5ORmMWBkYuBlkxRRb7xjWZVlVykZ1r/12GGcTKBDKFgYtTACay4TH7fxftgC3aC3eJHsnW Y+Vewb91jl0l33KGo2sWHGcL2M0gyRXcePCRcaZgx63HsxR/LVt6au9Onc2FE7pyFYq3HlVXLJr 4W/bUbXZzV9c9LtFB/xW3XcyXXCrRG7fk8HSn0yddvjEpm8Y9CxK0sLnLLBLxQFDBpfnHb+FJj7 tid/ulmM/h1VzpUH67fItb9trUpSacu3rFPZwMCvZW+RVedFSLNeiLmfbwnG6CeRvXFWvDX37tK Q11LEUCe65cdwj4W7WwkVHccu22qI6XOdUqtbOM1/1cxnjb2kBwU3TK7Yoph3/PSzZ7+Xy92uS0 7+qiUrGHphn4PnN69WcL28qJ9Uf+c2yKfHM1M8lp7dFSAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So rt4831_of_match[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/rt4831.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
index 1ab8870e4ebf..2b3f84b81c65 100644
--- a/drivers/mfd/rt4831.c
+++ b/drivers/mfd/rt4831.c
@@ -98,7 +98,7 @@ static void rt4831_remove(struct i2c_client *client)
 		dev_warn(&client->dev, "Failed to disable outputs (%pe)\n", ERR_PTR(ret));
 }
 
-static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+static const struct of_device_id rt4831_of_match[] = {
 	{ .compatible = "richtek,rt4831", },
 	{}
 };
-- 
2.55.0.11.g153666a7d9bb

