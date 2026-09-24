Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBDA480DFF
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261045; cv=none; b=TX14VxHGjE20ZdTToFPqNsxqOFxr6iZmy8JhKPRW2MR07v820e+oB4kxZKvoSzbFrzZKqI68U8g819QHzYWZerINHY23wbhNr54HOi917JtEa4Adr9kYH0kY3e6PgXpyud146Il1Mq7gjfE3QD3zIvR7oeN3f0fk7Ln2pTywnPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261045; c=relaxed/simple;
	bh=sLJrYImmpj7cDJOuqV/tBWAPnB7FJaQ0Atb+mCiWXi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvoL0Mh8FBpH8rkUXg4KTI1pkDkPo0cCpUYOsW20BKcbCD1cOhs/Jlue41zGefJtjP10uC5Wv2jbtTIA/omViP12WQxFXQJWnrIw72VtKJx2NO6fPfL2yeSnZQiq/whtucU2Yn2xNtT0I0S3Yp53uax/rB5k060iYXN7cQc9Aq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYzaw7kd; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYzaw7kd"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1037593a12.1
        for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790261043; x=1790865843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDZWmJgca/oRmUPYb8QTvKV4Z0J2CBYz2565yw2xf3w=;
        b=sYzaw7kdSgVyvGGTmCO8K32N+X5GnKEXCGhLHnCtAJf/lFc5YiEJNzk10CbEUchgsk
         4C6hk4SznGLmFvKEI1g8imdLlq/acRwvv12cZeKT2tMb0AXawR5wbA2camdJ09hbcBfo
         L4jHY6FvTtX10+z8yTUChLIRFgEE8H2on3sID5Kbxy1glF4w5UPCbvCduM8b1pDVrVR5
         iDA90IrjcQ6EALmvGZtwLcUpIo6ax2RJTPageOte3CNiqTTiUS3Zh7HWrYrJ+FBfZ3Pn
         riEvtiFEUU8widWsN3Qe8RVNSq8MKv0rhI9Ce4W/OyTP1a5D9WsbL/TovcpUhPwhFdbF
         3YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261043; x=1790865843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDZWmJgca/oRmUPYb8QTvKV4Z0J2CBYz2565yw2xf3w=;
        b=y4hdLBDvIqXJuaU3nmWhH0dETZSAis0MBKJebssRr7XVw6xjMXOVrp4kveU4NCM8q2
         RZMRl3dTJUeifRY+3ItQrhslC1Is9e2rtUa6NXZu8JW692/LZ/Dcrsg7MfJRvZ0aP1Mb
         Dmr/PW6Rxa211a2vQI8di7W6sdV0++LU+8OgTPklbjGu3KsaKp09FoArIJs6t25sLgzS
         AzgthMH2AGhujf1vhf2v8vZ25Yr+CdRI11fWZDc/wkXzDcS+29W1twIGmiyuUS56O3Le
         7gNxkLaOOsGW7Ttj329QH+JZIeH+/NYDUFhK56GYUgzOJu0cuu4xsdoT84Qlrq1HtSNq
         M9gg==
X-Forwarded-Encrypted: i=1; AKwUvBykle2RXVqwX+8D83bxwVyZTQtm+1Racx3bucCEiQUgAy2XTLq+h9DTSOlDq9qVX6D/UEk=@lists.linux.dev
X-Gm-Message-State: AFuF++m2kA/ZGBJ3Xf2BFH2DbizZR+iHikK6qPawGyCg8Jlr5BT/koGE
	MQyBDd8JO3phfphtsBecQbYsroy+4ym2nvYF0nBx0NQmcbUglMYHT4Xc
X-Gm-Gg: AYBFou1cZKh0jQQeamhv5qjhkkP45yNagK2Euk1iQDt9pZhefqnXUi4wi2wG843Wuuj
	s5UVtKIQIw0h0+Uv5WfUGyUIfLgzQ/wgP1TuJh+b0+puBMjwApRWRCsE+t5G51VFpa4BcMnBoMt
	Gr//h34l8SMKkp68mDPzFntjU0ugaJPHcrzYRKIMc914wpxA3yAdeBWHBxZj1sZbVtCWKlOGtAe
	IyXZwNzS8BWsg5C2jPZfOJeaEdJCIkWnAggBb4cAEBxmeDBwk753wxe7iM/Ld+7oDNEmDor8wVb
	B7QLCAwcINugAUZmA+0OWAD4fWm9v+Wu5MSNXwomz43eDhmTvpW+zF+tjq2IlCpfmdKgMK2oog8
	T48THOehQbWQ8Cj8CP3Ft0R6Fy8FhOan1LWnyXUHyqdaln8D4oQZyt5jz8gl0UT9CQAgcowwo4k
	Bu7JFjhj6qpGTUHN8iO946guWu0SJsdbSPo8+rWNMGZXcM4dRpT0fk7vW+JE0XGA==
X-Received: by 2002:a05:6a20:9149:b0:3d3:ae40:51e7 with SMTP id adf61e73a8af0-3de0e762e07mr2709521637.27.1790261043213;
        Thu, 24 Sep 2026 07:44:03 -0700 (PDT)
Received: from lgs.. ([47.82.103.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f2d0esm2982721a12.22.2026.09.24.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:44:02 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Ludovic Barre <ludovic.barre@stericsson.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Julien Delacou <julien.delacou@stericsson.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mfd: ab8500: fix child device leaks on probe failure
Date: Thu, 24 Sep 2026 22:43:55 +0800
Message-ID: <20260924144355.1604369-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ab8500_probe() registers MFD child devices before completing the
remaining device initialization. If a later MFD registration or sysfs
group creation fails, previously registered child devices are not
removed.

Use devm_mfd_add_devices() so registered MFD child devices are removed
when probe fails.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use devm_mfd_add_devices() for all MFD child registrations, as
    suggested by Lee Jones.

 drivers/mfd/ab8500-core.c | 44 ++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..55dd9ad285ae 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1194,39 +1194,41 @@ static int ab8500_probe(struct platform_device *pdev)
 		return ret;
 
 	if (is_ab9540(ab8500))
-		ret = mfd_add_devices(ab8500->dev, 0, ab9540_devs,
-				ARRAY_SIZE(ab9540_devs), NULL,
-				0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab9540_devs,
+					   ARRAY_SIZE(ab9540_devs), NULL,
+					   0, ab8500->domain);
 	else if (is_ab8540(ab8500)) {
-		ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
-			      ARRAY_SIZE(ab8540_devs), NULL,
-			      0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
+					   ARRAY_SIZE(ab8540_devs), NULL,
+					   0, ab8500->domain);
 		if (ret)
 			return ret;
 
 		if (is_ab8540_1p2_or_earlier(ab8500))
-			ret = mfd_add_devices(ab8500->dev, 0, ab8540_cut1_devs,
-			      ARRAY_SIZE(ab8540_cut1_devs), NULL,
-			      0, ab8500->domain);
+			ret = devm_mfd_add_devices(ab8500->dev, 0,
+						   ab8540_cut1_devs,
+						   ARRAY_SIZE(ab8540_cut1_devs),
+						   NULL, 0, ab8500->domain);
 		else /* ab8540 >= cut2 */
-			ret = mfd_add_devices(ab8500->dev, 0, ab8540_cut2_devs,
-			      ARRAY_SIZE(ab8540_cut2_devs), NULL,
-			      0, ab8500->domain);
+			ret = devm_mfd_add_devices(ab8500->dev, 0,
+						   ab8540_cut2_devs,
+						   ARRAY_SIZE(ab8540_cut2_devs),
+						   NULL, 0, ab8500->domain);
 	} else if (is_ab8505(ab8500))
-		ret = mfd_add_devices(ab8500->dev, 0, ab8505_devs,
-			      ARRAY_SIZE(ab8505_devs), NULL,
-			      0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab8505_devs,
+					   ARRAY_SIZE(ab8505_devs), NULL,
+					   0, ab8500->domain);
 	else
-		ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
-				ARRAY_SIZE(ab8500_devs), NULL,
-				0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_devs,
+					   ARRAY_SIZE(ab8500_devs), NULL,
+					   0, ab8500->domain);
 	if (ret)
 		return ret;
 
 	/* Add battery management devices */
-	ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
-			      ARRAY_SIZE(ab8500_bm_devs), NULL,
-			      0, ab8500->domain);
+	ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
+				   ARRAY_SIZE(ab8500_bm_devs), NULL,
+				   0, ab8500->domain);
 	if (ret)
 		dev_err(ab8500->dev, "error adding bm devices\n");
 
-- 
2.43.0

