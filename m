Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ECD519922
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569427; cv=none; b=pPzzgvZHSxHoowpdHxzS5BRflM8JKOupheKpY7n62X9+OXy7GQRfRwI6iV+z82uBs7O/GblJfLkl+fYGtsy4cwDIEpO6/L6lZVxs2Bt8mPtZQR2wbUSI1PjC+h8tEbt7jCJZGQF+xabg4Qof4UVnByw/DzFp5kz0I+q3pTTxK0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569427; c=relaxed/simple;
	bh=xNWXjh2jZNqUOiPZC4IQkFyQMkKV6evtU42asOP+reA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sm8DVPlduBJ2N8G4Xj3vv+l6TYOgEetUpyC4+EMeLkCaIU2l6Lmw3pikKz9KL7Y/YInDq/uKWl1nm1x6XB1jm1Xg5BVtRJW6XNyRgY3OKqzpg1N3fyD6//gxuDOS1X6fPkUeTRI/xqMkecRDO6wVfLTC2ilPHSMumLTuVI9YLig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNbYbBvz; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNbYbBvz"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso1170861e87.1
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569421; x=1790174221; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufX6v0lew7XrjHWTQTFcEf1Xg5s99AqsmFqOBj55n5o=;
        b=VNbYbBvz6bHJ5k8Obu8Rdc8Uox050ei0gXIczqLiKWZWS50TOCwdr3fZ9GdSfUFNil
         M8BM958bzAAGcD6FH/HHRN7hAhKpDJXjBYGpXrBBgkQ58GwZFfdFHJP9dordTqPcrYnr
         Iat0qB7rQcKm0zM/qPuc52X6tSCP8g+NQ2+Uj0+GXUHHKg24evvnpRxXhjAhA4P2EOMn
         8H8WtFjUpSEmwixpexiWA5HEQyJ8T4z2LpAVFEfC4sonNhW4aKuNCHRtS5A0s1jiVcDT
         AK/Ov7lfe276BqzSmnrm/EDhySNXHLzUn5StVM7JITVOVweZcBQ4eEbuYBmKX+R6RrLs
         FNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569421; x=1790174221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufX6v0lew7XrjHWTQTFcEf1Xg5s99AqsmFqOBj55n5o=;
        b=CqLuGaTDEd2kf7cmiKVuN51eAL22YYHhBhvdMw9WEr3N//MoogdnyqrE0bnHvEvNix
         AVp1d7b4Orq6asZD+a+uhlKaatV3lv1cb5+rmrs3tcajbxKyF5p7k9xydDnJ4Yz8YmHe
         EL76CXnQwwIDJFcAQJldt0oKfTy6550NbEVHPOq90GF+65vkPobbkpeqEC3ZL40GoJht
         ljKPsCE31jDPYr1f3QwwhGOIy4WjEjl7q5cUHh3TIWtjgOGr1zj2tLwV6kqY/pgwP2Ar
         MfxnEPQnElI37QqGxoHGOwTZw0mDviS02vMfOmRsAo3olhilosg4MsX6h6xxyXVWR3TR
         0H2g==
X-Gm-Message-State: AFuF++nyiadpmoXyYx2EaqE8BgEZbajvWFfXHZRxZt2KuGcGLGsFa/yJ
	8cqGs9PfREkpNtI8k+nISGvq7O85Int2X7EVoN+UENOZF9l6xtVtW6s=
X-Gm-Gg: AYBFou2I0j9t1UDCE7faQOdH755GmcxGRY4o/PW42xTDJTrZAD3OqJM5cExs73Ynavf
	sCK/bkalwGBFLV5/SYaTCNCiNklJxsED4SjAIu+sOtT+tNwxAoqI/ozFb4CACGV6YXqPv7/ucWp
	hqDNd4tCX0i/W74Uh2sMPnQYTZrAy07TljH1BbVaIOBdd4ppgFkmGyjn6r25Fs6SePTSefd5V/5
	Zk2FIQf08kgp/N5DXsOwiK+QhuzrF9b/Sy3aA4OO0TBtRB50o1bIa/sAVkZd63/k/2+7jba3is1
	FvFs8mM/Ca8/Fx6kaL8p3QrukREPyjT+NzGjVTgF4ll+4U1ex2lQg+LpsPq3SsTaGm2+y66HBJL
	blCflcNKWznh/dfjtNp2Pd5zm3JQrASUzCn7IbcxxTfzPPp2Kq29yYtCr7vOeD3G/mz3+gKaXsM
	FsEMcdZug59u4yx205GamayOZIWVPajgyZyUN+gs6iw2/dzxAKQTUeMR58oLMBnUvgJsBKrYqlC
	N/uzYMqOpLhGD4/Jy/Vkgk17i/BXIUYlfYA
X-Received: by 2002:a05:6512:2390:b0:5b7:518a:fe57 with SMTP id 2adb3069b0e04-5b8b664c839mr925372e87.39.1789569420831;
        Wed, 16 Sep 2026 07:37:00 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:00 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:41 +0500
Subject: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-3-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=xNWXjh2jZNqUOiPZC4IQkFyQMkKV6evtU42asOP+reA=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmH447aC/HryKCjz2EfIa561rW+fvUeP1DmG
 vL+R1k+6tGJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 om5wD/wP7wOu9p6ii/PYG1fI6dc3hxzCshOrpD28DfA7aO6j6fpT8C6pqOy+IB8hNyOHdIuEygF
 m3vRvYjbVuxlafJMj2V7enO5sL9+JzSkwmwyqT3DfF54FDzN2CQluqK1j1lAzABNxm6gXT3AnMy
 1TgVpnsxo2P86wkNrVguuP4058uUdmzABaxY5SvP2mhEf7MZNKxELna8AmCWfwknQxsHi9VFwj/
 vmGpksHlt9kKZFbO8yOSZMw4hu46d6tPGq8xRJcgbz5qrzbYdvL/xHlCPyk0I3NBBOI1JQ27K60
 Klqkb7ecbF1y7+nQluNUwUQ3TKO4Nkus7b2ITGNXdBijPsOpt1Zwn+V5iNlDuHP32iJtNj1P3IY
 yIRBT5qYMexWcZIwkEeeZLAYn4ZPD3GBk9vEqZmQNKDKXj4Avt8s5Va/kw4z5gFSvp4x6cFC7GA
 6ow3M3HI6bc8sNpXGCb3HD4jbxH0fQoIwh/WxgCAIUBut41t4wk12eFVYDAAN8IiWpnk4hj+/+l
 FlOc/4q9I7y/KFVAb8IIZ+WXY0+zhY0PftsX8CQyAnBwzPKFkX91KSZeCUhwtX0O0HLFa6qi5b5
 +ctuW33yQHV7CuYFmliVd77ciJAenc4WVew6c0DQgfKIDTf3m9S3XlVL5jNm2j/GyuWXL6CRMvh
 gXNM61a9ekcFogg==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

There is no point to keep the variable dir just to assing
lpss->debugfs to it later, just use lpss->debugfs directly.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 190de88d146aae9418566adf36a47d11afa90b2a..f1a8feb0fdf2042a3b6a8422400cb8f9511b4876 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -144,18 +144,18 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
 
 static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
-	struct dentry *dir;
-
-	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
+	lpss->debugfs = debugfs_create_dir(dev_name(lpss->dev),
+					   intel_lpss_debugfs);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
-
-	lpss->debugfs = dir;
+	debugfs_create_x32("capabilities", 0444,
+			   lpss->debugfs, &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444,
+			   lpss->debugfs, &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444,
+			   lpss->debugfs, &lpss->idle_ltr);
 }
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)

-- 
2.47.3

