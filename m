Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347778;
	b=rhkE6hwbJiucAOp+22OoBP8Npq3IHEF1utNOsfSTHB9eNztWcVq+oazrx+rmuLpttfdf
	 pJPCP51Y7QzYvt+oVdctoDU8UayZGnDPbroqqeOZH9mjP7yKU/khUjRctTFd2dNZMu1QF
	 LrN06NAS4grhQ4buiGAcF/ORHC3/73v6WMvZWTRHWdspo070dX934rcQfpWL1ixUan3S4
	 bM46Az9KOxRyKxocNC8RFALdArmNcAg1eB4AynMPb/o3bI8BJ0z6MJrF+5VQW7gXtMqr6
	 tmVGo+J1I3NGjW7VPh8bsc1we1AuIXMzwrvvCQvhSPQVsSuqW7a2AzLdcAkDPnS9ZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=STzANkY8nyx56+Y1zhCFIdRacjYJ7BNxETioSLE/rRQ=;
	b=30hQpXj2gU9PsKr7N1V2E0cfw8VC5qatxHIhZymWzf24KemBhbjdv8LVfoh+ws9cyz7x
	 uZlNGyozYIULioGuQCCFDWOzX4TWHFbkV/lVUJWEvSswU5yGhDKvodOQdemGz+XXMMKwh
	 JBhcr/HqHSL5DulbzNo62mKsE40aR5KGBJ6DcanNvi8xhLYWtdIBVh3rsZpnQGrWQD2nC
	 ZQR6Se9XVRZeOFiFrDksSra4oeA/HU+ZIrxePA5wbJQ2+gobbuHsEdAPbN/FgUzAZ0trN
	 o5SvmFEyejCIwK5+HpwfTvbwRCR+Ig2PELpvHfNXLagdRFTFqxdxysZBu9aNkEX+vWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JcsNbTaQ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD80760A5BD2
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD80760A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JcsNbTaQ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so23673535e9.1
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347776; x=1794952576; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STzANkY8nyx56+Y1zhCFIdRacjYJ7BNxETioSLE/rRQ=;
        b=JcsNbTaQvoseAPkp0NlC2GLgSx8z1CccK/GVzCaZp9kR4aygXK4+w0OPd1wm9rDyAG
         0qVHTX+oGaYupo8Msbet+pHVA0io2W6ro+LBjqmcM700e59MbAkmrcYOhRZL6juPpX2z
         aSIN3WMruPyQkJOHoRru8n6jVcggrFRo+LT0BT49mFNt0NfEQxwQGw/tt3l51FYk1qio
         Hf/P/UF9E5PyvzA1QZLiZ9wCmDHxWgUqzzpvPbRvDfOVORoSruPB0rGgpVeHZa1zSmgv
         oFT8EhYTn18kUOYLdd/DAoNscS0CZ3RO+l7quz/0VQJKr1rHgFuWF3hRPNifu7ORWZTK
         wwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347776; x=1794952576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STzANkY8nyx56+Y1zhCFIdRacjYJ7BNxETioSLE/rRQ=;
        b=SXE/aDSLLbrpWpvKuI7nsNiblrTdrDOfZOU60zACIVdGcJkptgEmifgvkOo+C+Y4Yv
         6rNO/+G0fQZW8RQxuo1GtP1ipULsccqdL9QANopyauGZmOpLHnjDUx/OoyUzQtC1NNnR
         oIX9Gxmm/pJRIiZMp5+0u39ao7oLB/RQprbjBuqC+Q3YENfULPvH09meM86x2hXuwz2R
         zbXX2z7N8ZS5UC/isDX9ArpUxtLlPyulUXSx6+nKTbP3CzJ15FnykgE/YfUDDap3j2dA
         gFiZ8MYSpQ82rGLNuJH5b2+azfpPBWGKBn0s2i2zI2pT10frndjei9stTtLzJfV63COR
         1GiA==
X-Forwarded-Encrypted: i=1; AL+hErGeHG4OxDo7u+Le67q9j9g5+y2S/9PXbUIyaWDySN/usBgexdvif+0oixsD1eSORna9P3w=@lists.linux.dev
X-Gm-Message-State: APuU4Z9+OZkp4C/PlrHjNr3uVXfp8d+CwIlNghZL0D6DswGn0xujrg8t
	4zqUWgou5OXBVpFIuY8MjHgn+iMS91edZ31QNs9lCDelvgfsYKUaEC+5x9eOR7gZDy8=
X-Gm-Gg: AYBFou3e/6aLTFxx6nifhSpBIFHt69W1iWON3DZTUYb40cIBndPd1xagwf3ETIwT5C0
	vURTA23nU7n30hMj97FPOQ1krMIIdNcpKTqsQICBu8hg+cguhRhksAccjDw5RxH6X+JKtEsxfhN
	XxSWakA5JpLxrwBkZmzwuj56paU3yiwYolq8CnVEnyeJJ78YB10tXvhfwftsD0PF4nNizXnbjVk
	TwOXXZvR8tMGmGT8JcbLnQGp5oiz/ivxKoJUkQ2wZnW3eSx5n3nab2NTARATbOp4f6rsYIAOedC
	L+kQsKrNM4x+KN6DTaJA1tXgwERpCMXdSvOHxBtjKfvlkiXgbefU/akUj6AbhAHqPIfMHHTEZkO
	LoFWAmQ1N+pUQ8qQEtWIcOuVwzq0vrG6/dYPaxgZwj2BcM0bNk3+O6+eg5lvy5zd1ji8QYSG5aA
	dLBeeMwvHUn/8lya6XVzOxjXp4k7qiowlAByGSgUqgBbHALsGCWkxFkd8UvYmAXJhYTVzXJUqV2
	gB6FQ2taAn9QrOU5L5JBPkTUcu5eK58zDMDsTMWpBbOQuz5mpy6wCFNQeGYN73Pxy81tz3GhPT+
	8DFW4+C+ztdnUUl8KbfIdXV9XTtEPyZ+PyFKNhCsyJX2i6PpBIggqcM=
X-Received: by 2002:a05:600c:3e87:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4ba0936f37bmr5727395e9.25.1794347776190;
        Tue, 10 Nov 2026 13:56:16 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fdac9csm136881265e9.0.2026.11.10.13.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:14 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 11/20] mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array
Date: Tue, 10 Nov 2026 22:54:36 +0100
Message-ID:  <d8c4d54e73f0faf117b21c740b7145060ebd1549.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=40u3a+wWHwFBZ+Zs617rF+y97u+IzuxtZReM2gRtgpY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85K733gLt6jT8hSJPuipPCXhqpEwDEQA6oNBl jJyfqhiuX6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSuwAKCRCPgPtYfRL+ Tnn5CACoJWIgVzcRqkgZcTr/Yt2EIkCzgbzZ1hnzkSfFO3KdoLCkaR94C5XTPKw89baz7d0Utjc 7iM4iu9HHO8/bJPM68/twcdxUQTQjen6Jj90fVQUH5MGDKu/VbH9gYpt+NICypdKQbT14x4v6PF rJ7oeVbVj97owsOQRb06aU5CD+4RrRJA9aWev2E5MT3m9nVtNTLMPfh2/5oL7x3jKs1XCHzHz6r TFnq0QGbilrxUWTSdBhBgJqjyRX7w7fXLVN3mjez1HQ3e1sDsVAia1LmWeLpRMRlo6hB2Dvz7w6 JrzWEpwBq3NTYfRF6o/5iper4wDN9C+u7zwJa9tp4bSASB5z
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

Reviewed-by: Linus Walleij <linusw@kernel.org>
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
2.56.0.rc1

