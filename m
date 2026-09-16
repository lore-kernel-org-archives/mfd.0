Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60E65221C0
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575854; cv=none; b=T55+dmwZssudMVCXtLAE5hbHKo8NVlFka0QaHqrRcmX0gb4xJ5GzXnWQ8sMJhgQYulGBKemVTPGuB1CA9yn9bRU2qc5GLorlC8Kal31iOfAsXnw0DHXkhcg0f/QJXtGArkFoy8aK5FlXwIOwHMrkR1mWXFdbmT+xKCYhdO4bsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575854; c=relaxed/simple;
	bh=FGooVTE3n+m1r0RsIid6S680o4fwqpE02/2UW1WT6nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBdhIjwk5CTc3DOaYUCSfrReNhC1xrwRQoqe4ofUwgum92fqcD84i16sKhmBffJZUB0YndMdv8l6tNtZWq1Gyoupsv4gAlmZq5gHbKoc7FQJIMnY3R5HUW+kFkbStydCiQ4+2nmBxQ410nkISgbVQYTXlqvXtOjgL/93PEr3aPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FO0cuPTI; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FO0cuPTI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso1733335e87.2
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575839; x=1790180639; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDvMkgbafi6lx7PZBb2hbKVmFp4OiPWqrc5pACb/aFw=;
        b=FO0cuPTIe10Em4RQk1G3WW9EeyZ4V5vrHLTtpBx1T4OBWho9MyJyblIJuAwmRaoWBL
         CIMqPG4DvEliaG6plIC9tDpQtA0UUMTDWGtJuacT6sWsKL/A+avSYKfK5w+Q1lE56alr
         /HJz2DhVuWtinPNN/ruIEoKgJSbgoSBw2dGyTgpA/w2TzEvu6V3pXQjDTc2CvskyIDJe
         iZU5r0efp1oq/B5Hw6+tIPdrlDOmqi0nlXQkVdZe9TpPBka9ul68E6MEA1EuAplLe5Ic
         p7ZbtzJfW9KUVudc3o8oV24hlfccdsSiIq2zyjEs9DwzHEQUX93/1nhqTTIdBKihq1vA
         01Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575839; x=1790180639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDvMkgbafi6lx7PZBb2hbKVmFp4OiPWqrc5pACb/aFw=;
        b=YWRYVUtuwf76GRQjiBZ1oilT/E3cQwPL+15V/I6FxodkVvFWIVWHLZrZL0K1a1sKeC
         SOYHTQneKmjMFvdD990sWE1k+Gv7xkNEFVjMnkj3o0V1g9k23+R9kOcF+H/u61G/dhdl
         jALJDEapC2ypQ++yYYxIp0ok/f2+eof8lxL2HhRdRRs0Vvt4fr6cGFKrtv8zhCmcV57G
         O/rudohXgC7r+dEZW1hMJ7Do7f5++zNX2VwyWaU7jWKAoQgXhKB3qIpCwiu1zBmSKP0o
         H5+AoQ5rLqoq7s39s5pDPUYBDtODs8O/BtPJwvGOuhIaVdQrPrETk0jHOpUyNaX3qKkM
         6gSA==
X-Gm-Message-State: AFuF++lYSduYDeI+tbg39ijxpjCyl2iol3REgsK3gUNyAW/B0d1jdmA2
	ldc2OnXGQ/MgX0eeAlKVSi+1J7PqoQ4lhOWJhIRL0uTuVF5Fl57NmYY=
X-Gm-Gg: AYBFou108munb/+QuZzoMM2FfXShooISZ3hq3FIK5q8foyCsoH06xYvLxUDktBkEIOl
	bVPjMbuvTA9dNIrhQm2LWc0RrjgEtW+JiOcaepvB0ZdbQAfp0X4ue4mW09xrrKfNzydssc4d6vj
	tP+0Br+bz/ENn9SGWvH4f9WI4QODUmsfDVoBHl6aOVSOQCAg21OiHwgPeCAIqrr5mvFd4wgyLfn
	NUYpRq6bmMStst/S1HNT2utrneWZ7iGN2tPhoTGc1wiCirR+pObuoYbjDCZcRGzf+KB4OU+0QWU
	AmxUxeROK5MXNbWrF4cp7nMrN20zGAAW/fz7qVRN2f4R061NUIK0HFNUAf/F5CJsRJwvj9tgVtg
	Q/PWwYhlyC/F1McjxkdtnhIDo3LGww9NQ6rzAXw9ngjf3QBPRqnD/njJS3a7CyPgvb31eRoNwj1
	L6Hw3ceuGdCtxbX7tqaRMxp0KuV8jdYN3ipXExT8S6LiPxr72OtJrnl/PKylT1ashxZzVNum0gu
	lAV7cxOTr0TxYlPnKEoI8Vw
X-Received: by 2002:a05:6512:10d2:b0:5ae:bd4d:852 with SMTP id 2adb3069b0e04-5b8b660a965mr1005663e87.5.1789575838649;
        Wed, 16 Sep 2026 09:23:58 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:23:56 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 21:23:47 +0500
Subject: [PATCH v7 1/4] mfd: intel-lpss: Remove redundant DebugFS error
 check
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v7-1-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=FGooVTE3n+m1r0RsIid6S680o4fwqpE02/2UW1WT6nk=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqsKY0qqZ8z2V4Ludy7CoJ+HYXkat4uBUe2QnC
 648hIXfre+JAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqrCmAAKCRAT637qmaOf
 ouaTD/9oWWuM0CJSFi0FlCQ0UbyKB4L+1vobuJZ3WVXPN//hcQLxwrETBGcmuAriRJqcEk8Vn7y
 otOPiKhzYQqbRWsYScAsw2XJlsPtFZZLXjhpYbIbOMMBxLnMQRgFQBYyJVnqhgIQrwQzXrtGCi8
 tdjaqk4zfcK7zls9DHSf6y3bKwhd8f9TcfCjw1dh8TbA7HvQLMQW2AGnS1UQTW9ecNlADCAh9As
 AOY3KKoMyw1ucrZRhBqLiwVoVX+jZRLPOpnV1ZzsZHNK24uZmUrDFpfjqd3mOa3/pL+1zl/bSh/
 WchQ7k8mFgS92SOJPNfgH+k4dtPvm+5mRMlg0l8beTi3DK7IHYqguGL8Q+0da3kwh+NwVP8nw6/
 vsYfBjeimAG+kBDBgXTi1iDprcxNikWyvvp3jwcTIJ2r2/4LTFJO620F/tu0U45Vu7wL2W/Xbi1
 ww+gxozHKT1BgF+DWWIB5i2i222Qt55AoNdM8Zq5n7bXu98Iq7TgTY35qL/gKXxg84gkSEHEf16
 yd6xn3nPCCGVTMPxOf1qZ6Szs2MX4lDP0uQwojMBid0HsmH2ctPkR/4s7vGhuyIF/NuOLD6HvqJ
 zfpwUz5VWkZQ+nE/VWynSHLDH1yBggJMAmNPUekhL8Nb1VZ6stIRme0FN6CYwc57zx5pzTn61gL
 A036FtYQ2p3owlQ==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

The DebugFS API is designed to handle errors gracefully.
Any explicit checking on return values is considered an anti-pattern.

This patch removes unnecessary error checking and converts
intel_lpss_debugfs_add() into a void function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f71457b2e09d238af0a9bfb897a169a64..b6958e99cf54d3c8eeca1ba38055a9389678f6c3 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -142,13 +142,11 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
 	lpss->idle_ltr = readl(lpss->priv + LPSS_PRIV_IDLELTR);
 }
 
-static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
+static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
 	struct dentry *dir;
 
 	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
@@ -158,7 +156,6 @@ static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
 	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
 
 	lpss->debugfs = dir;
-	return 0;
 }
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
@@ -432,10 +429,7 @@ int intel_lpss_probe(struct device *dev,
 		goto err_clk_register;
 
 	intel_lpss_ltr_expose(lpss);
-
-	ret = intel_lpss_debugfs_add(lpss);
-	if (ret)
-		dev_warn(dev, "Failed to create debugfs entries\n");
+	intel_lpss_debugfs_add(lpss);
 
 	if (intel_lpss_has_idma(lpss)) {
 		ret = mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,

-- 
2.47.3

