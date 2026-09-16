Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5385517BA0
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569424; cv=none; b=UgtkwHv1a3qZcg/+uX7oxYZHmAxmKFR04xvZsRzr46FGy/1Pp8fgh49YIjKrEt79awIxgW7JN+GoIlhd/bNz0tBFY+8vLo6uescU2HE4wQ6Iy5Je9IPs4gncZ+4ldCGd+FAe937OtdewFVXohyg7XbcsFC8tD2c4RnlLgnVndgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569424; c=relaxed/simple;
	bh=wLAj26g8Fos9OKny+J7HvStcJwwB6OXhbJxZsU6y7UI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkhX5xbgSNq5tcErRAngoQpDn0R/K6bl5Hj0z3X4ON5lWkIf63RaCPfDnf2HnF6ZtC2RgfFSNGV0JN7fPNyRNqOSLHjq9teFL39jPzxS1VJh0WtilsGj503qXTXYIso2NTXDk4BB9kwOqmBge8dLz0qGqFmLq13lYIzLgZqr2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srCkR00j; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srCkR00j"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b88dc3bc02so1088414e87.1
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569420; x=1790174220; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcRcL2F4/Q4OrY5UlSptZLs19ltKf0kc/HWNriLcOWA=;
        b=srCkR00jVQC9xMeuG21nq3zudkoEFNFC2BhpXBCUzk3Ow7PpLaVwLUD1gChWn+SHw/
         zFrS80ECnIWr+4c0BnxqLAJfcBwfZiLlPeRxVuKcYT9b4fEvwlDALLuMdWdlAxRIeLyX
         3Hd1nzkjMFQDDOaxWnBTn3zlPFp7RrEDM/0QfzdbN4gMoglf8YcP/1AzY+nblmTkmgt+
         AXP1+5wxbcCtUng/vSCJBgYBqNNddP7WWtJ/VceNg3bR2OYZ6TZnW9+CytwheXdTtbBk
         vJMNHhuUPQXnY/5cq9SwVmte8+VFRKgoZPsxdvFBeCOm0VjDjkHBeatIXHE0NWUPV6z8
         ZjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569420; x=1790174220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcRcL2F4/Q4OrY5UlSptZLs19ltKf0kc/HWNriLcOWA=;
        b=i9xF19JZLoyRLhi7tmSTIVY0I4vEwXWP3h/WXedGwCKZIvjgTJtJAZJxhhcbkH2pTF
         z75fF8I+o/M40nmgBELUDpxKw3SsjmgQ5P02zx9B/ZcRmAMSuJdBhxV19Bea6i1QDnQu
         4DfOyyKQzIDRTXp0jwUU+Aj3Gw+Qf3yjERpJYq62amC0ocZ6MkrLmt4bX9ossjSXxOwi
         oR46Q2V3girHL8b2th19CzXmfI5o4ObL2cVpWM233b0RtEe55pCDuzzeaxKvixslF4L7
         SMMRr7PazcEW1ZiyCIotNtUmMMG6ys/yR95XZCKL8SugY5xL1te0hDHpOPvnYsOb7ucO
         d1xQ==
X-Gm-Message-State: AFuF++kHxJe6lPsdK6y2FS4rgpghh1lHORj9GSCVc2R1taU1EHxl//a6
	Z6m8s+Lgmy27Wx1ae5pqg1ahYdrHrSuX9NRE6YD4FpDh7lKchNIQOAc=
X-Gm-Gg: AYBFou3RC/sLT+QCUkJEnfAGiLFkoN8ZXfnltm4wcc0I6862nKYlfsazo+AZn3eKZPb
	YAxjZJr2FGKqVqimvCqO3OSB8TSle2wv33agtHT0ieNQKLEwa0uLxv0nH73LM3jHe6Tw7n/m3hB
	Et9+KyGTCsKe/V7ZjXt/8ncaTS5y6HbJLK8tzzzR8H57nXa2gzfLt7jWBJ3OWxDLfFWHlyhnK0a
	YviBFMFJf50Zpe7sbYzyEKp0vh+yeTuLLQzhrHVLEUFv2OQ4DUq2gYFhWCbddpfBl/3Wju8e8aG
	vJPpYPQihY8KzS7YFfbQIXB6bnr7lFajM/HA0qqTgW2jSit3xaj91tmfHty2AODz9mRLRV6iknR
	7ZzcMcI2krIEhzXlfXQpXhZpMadTkDhz/KMYBjtYvFSp42FZePTyH8f0dr8JJIXBM5hXbPs+Sqd
	doh//tRlem6hxg3SJJ82UmxCem2Wo2BaPmczocC4vZUITKxpfyhmxA+nFYbAiKWfwLzQtLbdiw1
	2M84d8GSVMcUv+1lCKhh7f3zDmeT5Tf1Ag=
X-Received: by 2002:a05:6512:1322:b0:5b6:1a7d:5539 with SMTP id 2adb3069b0e04-5b8b666a871mr805388e87.64.1789569419597;
        Wed, 16 Sep 2026 07:36:59 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:36:59 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:40 +0500
Subject: [PATCH v6 2/4] mfd: intel-lpss: Use plain octal values for file
 permissions
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-2-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=wLAj26g8Fos9OKny+J7HvStcJwwB6OXhbJxZsU6y7UI=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmHdpqItY15gmUalc/Z7UMorhspKomLGbzhV
 eL7oiRKRAuJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 ovFTD/4vs6R6cJMl56Z2k7M+arjdgZbW5RedAlHmvCnHsfHbLLcSjgvCWRVqM9jXkNHen+Itd6d
 dg7L9hIBHzWV38UZp6yaWb6qxrTL2ufdSvD/NckBnY7bZUhdey3PIHQVNABOyqzN+dokmynOc2z
 g2zuCl9zhuLMdLP2ZIVa0r8/GUADmvFIq8bkgFw8yeQOGLFqIakbUAT8xQAeuFe9Jy5L/6gujUT
 lBxhwfk4OkSbQexi8M2Erl8eidiCBVCisdPehnsvvLIWZNVmBxArnL352crlBNt9GFuccEpModh
 31bVdRtY5RXoiR8X5eXkK7dxyH3SJeDYMC2PVQ5Et0sH6+yQK55xZyx6Nij8ujJ1IcZRFlgtIp3
 lqAYiL9phB3cZmdtefseDvilZ19n229OXwpu/vcwuPG6rbXsUlXF3XGL0Uyr2LHk6PhQER0j4yR
 JcKJ+EQ4IoJ0MIN1xCvCZvitT7wWdfSvouZ1YW95TFYd88SejJkzxxBKwJRDxZlcXcTCrsXdcSy
 oTuDsOygzKxKFK95PaX9Sts9V5LrpPymcLzxOok4ebjwejf0HIFqBxkU2tr0UmegS61eqx/eqVs
 MCiVLT9opNgPfYhREBtG0in9h6VOxSSAeZbdbicbYmZ50Ahildo3cn4LNznewTmSQijB2bOcdvW
 pEerLfZ/bnkxFcg==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

S_IRUGO macro is obsoleted and not recommended to use,
therefore replace it with plain octal values.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index b6958e99cf54d3c8eeca1ba38055a9389678f6c3..190de88d146aae9418566adf36a47d11afa90b2a 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -151,9 +151,9 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", S_IRUGO, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", S_IRUGO, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
+	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
 
 	lpss->debugfs = dir;
 }

-- 
2.47.3

