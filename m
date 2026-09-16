Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9490847D925
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575858; cv=none; b=pmX8a2BGQrP1fxS9Ht6qeSPmrXCy8tWmR2BnT9LC2Bs4gGleCpZUeHpYPhP5uFFQoU86V8CRS6o7EiIJ2YO4XNo09TFYplIKFaEeV2JsGhn4TmMR38dTtWdtbR+X0w+w5WeEvoS7qcY0f17LCbYCYuS5Nwx1r5vDgI9lSoc1edM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575858; c=relaxed/simple;
	bh=Nm6zX8XPygc+p59J2oDayh7WjG7FSWCmsJBilKbnuzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=at4EutDZHJbqfHjWhXrEoO7I0lgWglLn8qGs+lp6M/w5UiDK+2trvy95fyGvX4+caTJF1m9yZFC2nX+zTuApAV2hXJPmH+wX9cgX2yzvrbBoD0U+sZwy+srqtaHD3e+irdDbVfrkMQNyShPcYf+IDxUFtOmJnv9ky+1NfCY3/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaVJpMgT; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaVJpMgT"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so1065160e87.3
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575843; x=1790180643; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSssA3z9TUNm9jol6lXKxC8Q/TlR657pACAtM50aYXs=;
        b=KaVJpMgTFFNRsSG/AL/erM4EXlHmHoekHJgYec/jbD+e87urOrJl3K7G45bKxS+27q
         hp1C14v3UGteU/QPxc0PZL4vnLAeyvVBlVbUFyiPn+QRSWZnoFVmj8rmtqX9zSEbrHnb
         blSpIkepBRdzd9tzk8gMaV0GS71ThdnK65pweh6Mt1m1iywmVxxUA+ThQcjKCvFxLl4L
         wEtvBKetZoKIoB2ZE+Ph0YQcB1Xrn8dTOWIOrPZuEj6LhgvTg2H1hQfktBtqm6gpXGAr
         7A1yDhI7eDYQ1+Jfh4yKTYUy1FiM2ahfZLyV57QrBZqEio8R4xZsfm7t56byvRN22/PG
         1smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575843; x=1790180643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSssA3z9TUNm9jol6lXKxC8Q/TlR657pACAtM50aYXs=;
        b=uKpfMedTnNDPQunERrDRv/4J25XVgNRxdmgJuII9H4zJT7MVmvyDonJQjxJeTveV//
         /J0SmU1gXDiwdAEN2MneoJ1j/NZLSu6QVqjJUwrf9muMJVvNSSzf+ZHHCeEnkhMBOepO
         Z64XOuAytIzle56SwC8bWhsj5vwPcXixPWYJ+PqsVYULxvHQ1gZYovSGeDDG09cTydfg
         V5Y6duZzBI17ndY0+CK02NDDkj/3CUR9qcVhkK5u0CacxQeFEfA/mmAhjGBbTdoYVU2/
         lZ33GHkkHAdEsOci+1K1ZyZKZnULcHCG4ePKnOWVMGsN4cyXmWmoMMGinQmNflNhr6hI
         z5UQ==
X-Gm-Message-State: AFuF++nrPG6dnK5OfU69k+VrxM+uXO483jTM6p7iFmBtjBFUB/aBgCD4
	ref/7Ug0WmGuXHdinfKQGxpGUdojJ5wuyiRbLtNU/m8aXc9Xx+vAKhw=
X-Gm-Gg: AYBFou27kEQNS8F5FjPCLDEisP6FgIbfMG+2wRsKuO/Uk+eMjbCaA+VIEywNi1e57s9
	CKcd5nDuuA4e3CPkJRU3ua43NK8F5EV7wgY1C1s6UII7vCIc6NwSLwDQ0B8SdgRpa2Nm1OqNsb5
	3SEG73LNBnf871EVyczF6OjO/vnEVFF2e02iRloImAFH6L/RIbe/D+gk/RfXizjTzEmjRUD8at3
	dPp785wquOCT1NaIf6qB8FWJJl3HIIL3MbdYMQlfRuSefiB0Rilp4eoYmM9SckrxrPKf+bmW+2n
	Mmphdow1nYoTkG8hhtcg4XfgWWrlf9MwjJnEzrj8IUiQKV0Doe0RmR2xJQ6rqoXd8DncPrQjDpy
	CLMKS5+ilomHJ9r3GfmrPgaBOj596d42/CM5DsLy8WR7d/IWuboRmDyWQb42FMl/DwYTgkqaSq5
	9YpddEhpisCnb/ER3fnDcBskIl+X1+PLFCkt0WSN2T3RvxLFYRoqCUmv/66uLkLKtATFop7xpBE
	1yjDlQf6GbTKtguFnFitSsS
X-Received: by 2002:a05:6512:2216:b0:5b8:7eb7:4772 with SMTP id 2adb3069b0e04-5b8b665fb5bmr1009567e87.46.1789575842907;
        Wed, 16 Sep 2026 09:24:02 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:24:02 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 21:23:49 +0500
Subject: [PATCH v7 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v7-3-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=Nm6zX8XPygc+p59J2oDayh7WjG7FSWCmsJBilKbnuzY=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqsKY1awQcyaeSRKl65ISLjhQj3WDrUIPpqcWs
 V+AmgtFhXeJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqrCmAAKCRAT637qmaOf
 osRVD/9omU1wyxtD2xBSj1DucnIM3lHEaxnvuTkyBpVbJ7oCEkut2R32lAiSOwDEuzjHLhVzx7i
 RCkZu2kz1TMrQJl+1Z+RaXGuRPbQYeh/I5YnQV2sO10bjlLWAYgFg7Uz0Zi9eSpMpT3Y6geTOPF
 S43ChCEPSieGPlbJI86mlyMp3Yde+/Qf3x8eBdpcp/xPpJ/qk7KbAga1vW5a+cUlIgRn0Ek4Fwe
 bAEL7kq9JWc/RDOPYDcDkT6LYCU1BpqEzPl7f3hfLG4t3VoHBjQM2UNJzOWG31XKIEisT53R92U
 /k7QGwSkImRjhHjj3YbwE9LZCywK4uYbvAnITiEeJP6qDHjwMvGAr4krIYq19/f2MdbKIKbafwp
 OBE/WBuMNJxmjFSINAMpxL2a65NuOFK8xBXozGqeNkaYVBvO6VwufWyMIUtLfi36lMhZYka0+ml
 lwbmllA8xulL3RPKvYJsvOIXbA5ipUbl02zNNmi2B9zzgchqkWaEk5JULErBUEaAtZHLHSLH50S
 RtrY1+9h/J4beVkaLeRG15na19ccQJC/lctyZVKqp2NUXeW9T8IFISt7hJZiGADIeEEkGDNmOVx
 yQyni27/HdIy1Tjbd4MSO/Arx71xqtyCSTaxG2kD4xJKS32kGTa32ud994Vw6mkigrZ+XtAE2UM
 hm5KES8jA6eTVPA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

There is no point to keep the variable dir just to assing
lpss->debugfs to it later, just use lpss->debugfs directly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 190de88d146aae9418566adf36a47d11afa90b2a..170cc004a9449cb352e3e1ef22ceb35759368ff4 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -144,18 +144,14 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
 
 static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
-	struct dentry *dir;
-
-	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
+	lpss->debugfs = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
-
-	lpss->debugfs = dir;
+	debugfs_create_x32("capabilities", 0444, lpss->debugfs, &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444, lpss->debugfs, &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444, lpss->debugfs, &lpss->idle_ltr);
 }
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)

-- 
2.47.3

