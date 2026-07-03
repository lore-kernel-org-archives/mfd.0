Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672B3B8124
	for <mfd@lists.linux.dev>; Fri,  3 Jul 2026 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076407; cv=none; b=K5Rmv3RbU0/ZkCiwiBEpYfBMaXbgOWJ2r7SruLrbVgW9yB62psPkOawvjeIZ2HbrAZvQMsrJBHEoybPsmDEEeT/shXgy/t9k1TEbTjxw/PSisQlHxw3h0sUpODzxkfb61zehifAhB20hm/nF70dlqSzHWFcm/Obu7bvzi4NQ7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076407; c=relaxed/simple;
	bh=B+esDQOFjtEH40Ir5l1iTJFdJIvYqbu2NvdYyioUCOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5J3Y4wApSUhH7djqAuubr5sMdeq4PP1lHAom+Dvx3AvMBNW2S7fXnkzeTy3diA0OzTjYnnjfQIgv7HqqBxb8MaVWsCyZ2TnBxEANSRjTcXsPJhELJTYN8aJUyBDWvQiW74WCqN+pt1boMVs6RcFF1GVp54W0el0+rHR45VyMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaMAwSTs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaMAwSTs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c8017e981fso4356765ad.0
        for <mfd@lists.linux.dev>; Fri, 03 Jul 2026 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783076403; x=1783681203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7a5zgEqDsjiDOa59/2Euu+6bxEUj9/ITpa3Tg3Tl/HM=;
        b=IaMAwSTsHRsSJu4fY3Mv4o5m2bZUT2Nvj1GnpM9ssazPi2kJ59nSdYjmRFfGNNUATq
         /Kmd3/mNukC7GEcIlD6BVfGTeS059fCK1AITua5f+hpWPXNAm3jRujR6idlhOh4aLPpF
         1rd7RgKo+TQCZG+JPToZFqLvM7hSSxxWQA627PaUvVamkX6upsbWIn0BUrAPkMU5zWBL
         0QvUMlYHcGfbQKP5cDFAd4pTlJeZjjF5kfkHlE2laXnLNo6it4iG3YfwFiubgNyEjZl6
         YFSlWKwsBgf0B5MmbDnOIGl/wUcbWHrQCEHD+vLqCNxHIr/l8u6fJeOKHkvrIX4+Vk9E
         VLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076403; x=1783681203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a5zgEqDsjiDOa59/2Euu+6bxEUj9/ITpa3Tg3Tl/HM=;
        b=RXhyJc8WVOyjEbvfBgANX4dbtzFR49W3KRJ2vMiK7iuW16+dGjoGtwYA4V8lQvKnZk
         Nvwi7T2+RMwRzQqBmmSGKJAZfIJCzdHGoRVT8ZZu46j7XRnZ4IlV2Ow24adeJUxJsvXg
         buL2HROYiPa7H8qX2X/BIaWi/UzwmqZ2A0PHQhWKtGqPuHHBEqe/brSudbY2GuZJ/5qm
         8hrvVkQkhk/excGePFLdK06hJaWPGV9S74jiOfoPaDw3ZVKajNYk/nuoJqf9f8mGOXK0
         DQS/LTJI1cRnViPAg0RrMwHSSCtGF45GM7T3FSYNU0C6GjP1iHFpxOmh7UNwNQFnY6wg
         c41Q==
X-Gm-Message-State: AOJu0Yy5p7ayl6wNohlpAdFCOp1HAEAaWRQ//Cq8xdS2+E4a/q7XeXWG
	LstFRte7Q4ZG83Uus6/WM/8Sb21iDOW6QCFduPPlrLsdXDxbZitw8bMI
X-Gm-Gg: AfdE7clNUMl7WluvH9AlLVHp9qvZhwV6Q2ZeLO+3Dq4QltKSIjNxGLSPYDR4GMgFk3N
	D70SgLa8P+LSV4PCQIeOuW8RoKFojvQEeqETcBScF5PRP+XyDP09sDZ/0vRF2l5nsOuFdRnMc4l
	Oh3lOuc77aSwC4Rqeg7firyOWXU8MRofdU9U4yAmp5Q1lOQYCpSlB2Nb4P5vyuckgEqHlGJ0gUI
	4LpGVN+5nPL29set5YEwv3q9zoT15/Dy7ZIqWlkcnBW4Rd3/sPGrdYN1jDZaFoWLRKrifKsj6Xx
	aWbOGUCJT/uqMdnyB+25KFlx5qsnJETK51uURT2OfXdbzlZsfIHKC3/m3rSWE1EnpkExjHK0gCx
	AkuoNAfRQ4vQoXqkDeY81/AmOIE+a3073KV4ACfog/38MqdMv0y2NqL9j6c2RKyPI6yf0+khUto
	LlaZX/CsmdlDU=
X-Received: by 2002:a17:902:ef08:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2ca91206866mr93090535ad.36.1783076402585;
        Fri, 03 Jul 2026 04:00:02 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:185d:def2:c823:8e8c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm17050947c88.4.2026.07.03.03.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:00:02 -0700 (PDT)
From: mdshahid03@gmail.com
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] mfd: viperboard: remove redundant NULL check before kfree()
Date: Fri,  3 Jul 2026 16:29:37 +0530
Message-ID: <20260703105937.62541-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

kfree() safely handles NULL pointers, so the explicit NULL check
before calling kfree() is unnecessary.

This issue was reported by ifnullfree.cocci.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/mfd/viperboard.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/viperboard.c b/drivers/mfd/viperboard.c
index 888737b8e7be..36be8e69f45c 100644
--- a/drivers/mfd/viperboard.c
+++ b/drivers/mfd/viperboard.c
@@ -96,8 +96,7 @@ static int vprbrd_probe(struct usb_interface *interface,
 	return 0;
 
 error:
-	if (vb)
-		kfree(vb);
+	kfree(vb);
 
 	return ret;
 }
-- 
2.43.0

