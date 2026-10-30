Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374109;
	b=tdjr5FdogUhUyX03Yn1Pfh0Az8nFSz/jEbnqq6OXyEGTtsxHztokyC+IRoW1EQvw3Zfi
	 HOySXHX6E14GmTMi3sghKzsZaSEcgUSLLDlZTDhOd5D0wQTN5vR5+VbIdh4FKHmMfBhbc
	 igui2P1mUqyEsg0bruQJ1z2/ApP7NQb88m6xJM/Z0hDdWQco4uRVgovbuC1BqQjExnUT/
	 KZcuadogtgw8RJWwNM4Xc5MbRFrFlgAmvYYze1MFPFfjPVrFddwRA6zIY2xJp82Ga53Q8
	 OlGx375LZJpzENPhQFsMn2jnD+0j9Kvg+FrtfQOKt/vJXV/x/PrdkJ4sL38D5t6nqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
	b=x+vPgRgt2PFkH3Y6HNYpHmDkTnNOSD40QrjG+7VyN3WssDM4pv47IqfO8YvjduIUTM5U
	 hGapwyjgf5BfVmRjeaWWI2WWN0ask5ewBueNictPc9eRUK0TPvKe1q9KMWmzg69U5saFI
	 1aAT8IWM5dMR2LkQvEanQx+uR5t5CzUeDyIUBPwzOmLe9JtGER1ogLCMN2CRUCvpTL/iD
	 9ZVayNfDkDiMaV06Dsjt8aM+H8KZ2spkan82WhjfjOmY+busbMOXGKqhD75pyq0z/O9qO
	 ci1e++CsiXYm1LKTlu94iUbqS+Pj/BAaHJnKVshDQyLd3c4LMuO6SmesdwIiiDwoiUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+3+fxFw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WPunMv3m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B6606A31F
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 15:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0B6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+3+fxFw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WPunMv3m
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERM5J2968204
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 15:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFd
	KhIIYMKc=; b=U+3+fxFwbUycfEfDWzdEZEkezQkkmX5LhHYrXiKTKDmXAhAZAmX
	Ouc0e4EpDLJZ+tRPg5gGMM0QOnCKLEHj2+0TtUo1I1zMZ0ISFR2xN66sXTJzP4YW
	LoeoUnS8frQyxbD65ILv9il06sYulY5YGkY47LHB8VANKEN+T17I6C4AvklrZ2+E
	ZZOLiATmnONCPYJeFcHYab3hmFG7ekIH4KdEFn78kcSqgoBF8WRD15e+Dw8ITAp9
	5x4d/70RGHVNITYdJrtQY1t6KMpgqxyFZXE4t6CT2ntYHwPp9c1L+QaV4cX9QRaE
	Ski4NR74OILZ29kreLLAGIo0TdXc7iSxxkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkrdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 15:28:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so158329285a.0
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793374107; x=1793978907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
        b=WPunMv3mLj7ag3yWjjwRKyUTgKE2oSDDKd1Z/Qfri1KSl/6Ro52+fbsKmKxBdBRAl9
         VKwOKeKigmztW9bl2+g/Wd1LbM+1KeujZbienx5QWJDvSiEtldYouU7jd3YxNuFZdI1K
         ttqkH3ARLeMgOf3wQGzPY37YYvPbh0V6XefDlpVciAd1b51UMuiWbVEaU2LJNHJgWEAX
         2AGFHa+TxHjPHdom+E/cQx8DZPO4lhvNEjfNC3YjTLfttsyyxFKOBCmH+rWRgLTniB+q
         +Swphj9hQF+r3zkOQ1NwCrXzhoJ2XmaE0/XnjkDOMSubjaVA4znjhaoEJin1DalBCpHK
         OulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374107; x=1793978907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
        b=miphKP9rcdTMU2GHZb4MA1RCLwrWu0RW4KJP69/esHCCXsR3cirCdPEfqAIa5rzIvU
         6HQQJiuVfjNOVzpc85ZZIjSajCydipjstoaL/S/avaAAZ4f5smB/m+u0//x74wdU9lQq
         ihVzdBq3wq7xnPuaosTTUQx9Bk43W+I9ZWeJDKiN2RO3SIPbUb8LWXG7P2/78OYA9d0Y
         uExrufc/bNCanQAEqd4iT/y9/ujiE9bKCqC35XuYRHU7kET4q9kegFuy6DYgFGqHGtsC
         Z7zXPlsiI8Z4uBVkzW+cnfZuDtTM8DGXP6/ONKTEgjyXWvjFziCQhJMvJ2U+QQqwEJxG
         uGZw==
X-Forwarded-Encrypted: i=1; AKwUvBwn6qsQQQDZcecq2HV3drZ8uxlc357y8RxLraXFJjGpVMw6LOAe+YQCZ10WNGc3zF86YlE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLMV+NWw2CprCsAamm27lQ369aCkFLN7BkWn4SVXXDXAq9xBo2s
	/VUIVzU0xQgeWCWNBbowmHf7Doa+iHnK1nRxw4sFH3Meu8d5s0cT5sbbBX7/lEi//dByg2rp6fd
	DIXHT6mOvk8BtaTuSEQ5uD0AitnATQRq+oPpsyzSVdwVBRhrW7CK2n4Q=
X-Gm-Gg: AYBFou3J167Nk8tXXMA3X1czXanTQydcOzau7KCWwLKNEo7Vp6wcCnn8YYdSowvPX2t
	JXa4ZVkw1ThS9VqDWRjQU0VUxtlELIZ9V3KGCFKzct1kp+U4WyB5WpQk3u8JYSpcgK+JKP67D6m
	SD58os2HKjH+z8Eb+RmcHb/mtFzF8sUuwFahgdWbeEDvouEGPCBGvUpJxUC7mmaN5vQc8KF3EDx
	DQoQT1ecif2QEyE57JE7wReNH6NUn6xbikvEuGtHUle2tnKmYMg4PpUsGsIvv7hUGY/In47Q0tg
	P5ILnv+kPiepL5Lkp9n7Bb+wfxOjjLMnp4JeFOjYds9DYmi1rbQkY9KPcd/9Di8AfKb6EabFGs5
	q3TNKEaswOxX0f5XlC5AD2kwxZiPRpUyw1BmYKv4F2kWe7MmxIEFPqmf8mO3oNg==
X-Received: by 2002:a05:620a:480b:b0:93e:5fff:db07 with SMTP id af79cd13be357-9442175c1bemr457807085a.40.1793374107373;
        Fri, 30 Oct 2026 08:28:27 -0700 (PDT)
X-Received: by 2002:a05:620a:480b:b0:93e:5fff:db07 with SMTP id af79cd13be357-9442175c1bemr457799685a.40.1793374106734;
        Fri, 30 Oct 2026 08:28:26 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm68611655e9.2.2026.10.30.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:28:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: mfd: Drop MEN F21BMC (bouncing email)
Date: Fri, 30 Oct 2026 16:28:22 +0100
Message-ID: <20261030152821.283215-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kmNdPJPVrDCm9e0u73KRmJcOPX1/jig+MXW5yF+K7Dw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5LeW67VWmOyJl9abzEjB7AZHf33RHGV+iUb9V
 o3xT37t19GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauS3lgAKCRDBN2bmhouD
 12TLD/9UHhzB9Z2iclhe4fo+vxrjjRArNxuOUcSc99LCrx/pP6rmMi851ehP1mZm9863/6NI7rP
 9JiIol3rVgs1ak+t8fTNHW2KmiTKVUV/KUrAwjnee74F4/yfn92XwfJuQ+oPKHiVAfqgOkpaWVD
 k7zmsJrb2Bnu6KfvDzo1y5Oe4kjpsm7Un2+bHtPWBuuKi4T8HzcUSOn5xxLROvrp841M3H9j/m2
 0b7Zgr5LWI76z+ITgmpNINDoJtTbUL0nZ4ebxk+ShswE4/OjJ03C+Fup5LonLaoessEACzVXxaL
 J45SWgIOBOU0mFZCmcmwhDWZH+/onIumakKmocioSQEL8d80e44NlUyDehk4F5ZJMIoe90rAy6O
 tQtUtjoWjJiqLRWUqdosDwq077Zfw0QVavmXC8TXVPf/tuckcEHtoEPxzumhWDDYTJOCquBXRxx
 wOdVRkcM2beCYpoZhSAE70Flps6QGuLQCsZAcAyiXCdp97MWwQxMJV4RDD111RKbDehYwYxUZkJ
 0IijTO6Sw1AgXT2oYulLQj5HNfV8tBFaueHE41GorN0ueaEjz89SwRb3yA3itaTTlnqcFiu2D0B
 cG+O5Nne8q2rMBNQE4Gr7OF+UKbpvo4rVE0xlUGgOlMbhH1ry+aQ8poskus8B0glPkvPHhV1RJr c7uOwSrR+EZvlQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX3HFq1CJey5X/
 GqIhMzCtUtMbEmP36rD7mCnGOakdemKTr5Gbc0GHDwvVAsdDopTCeTzuR/IG/kQpUM9s0EkgDz3
 Gr8gakg+B2AOoAYusmst8YVla4J0G+yN/fEMGO4M0kBBvkMyYBe+vaFp+iKN1cfWhiecMamg6Iu
 1b0HH+X44SaVmoDcW/EHynAQQg2qi5W+O24CJdTaROPBQcqlFHDh/zgmN4DQ/rVQW8SOtobEPVD
 mNyoHVpZWbxFOw2H0Eh5S7mk3QLZR3cbHpu9NJ597HR6DZ6uu/yd+4WRH2Chp5FKg6AnA+mE/Mt
 OHvw1oXSga98SaQaPYNV/FJFztECAkMKp7PKteuUXR8fI+ytvhXYS0d1EjWShiR1e3H9kt/qb9A
 wh2ZlSVIBFtOQdRlhojLb85NY+oFWD51bvLL0Fe4NhLl57PA2rlUP/wIgKZo9UQaKhTd9NMHIvg
 I191Q4OPXE1147WoJ/A==
X-Proofpoint-GUID: h9M-tobr0k3Ca27TOHRnjS0lXDFIvcRK
X-Proofpoint-ORIG-GUID: h9M-tobr0k3Ca27TOHRnjS0lXDFIvcRK
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4b79c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2haQ2MhrNbTofsgfN2sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX1h+i36LSHyS9
 8utX82PE1Fc7vVlo05a3KPyGakfNtIp6+BEWsa51pldQAqQg8kYyOZmXquzazkxlfPSV/VYihON
 PBjLAbALRvvRBGMVKJ4X/kejd2agtII=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

Emails to Andreas Werner bounce ("reason: 550 5.4.1 Recipient address
rejected: Access denied.), so apparently driver is not supported
anymore.  Last emails from Andreas Werner are from 2016.  Drop the entry
completely.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Maybe this can go via MFD tree?
---
 MAINTAINERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 365bec8eb7fb..51673747ab91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17998,15 +17998,6 @@ F:	Documentation/driver-api/men-chameleon-bus.rst
 F:	drivers/mcb/
 F:	include/linux/mcb.h
 
-MEN F21BMC (Board Management Controller)
-M:	Andreas Werner <andreas.werner@men.de>
-S:	Supported
-F:	Documentation/hwmon/menf21bmc.rst
-F:	drivers/hwmon/menf21bmc_hwmon.c
-F:	drivers/leds/leds-menf21bmc.c
-F:	drivers/mfd/menf21bmc.c
-F:	drivers/watchdog/menf21bmc_wdt.c
-
 MEN Z069 WATCHDOG DRIVER
 M:	Johannes Thumshirn <jth@kernel.org>
 L:	linux-watchdog@vger.kernel.org
-- 
2.53.0

