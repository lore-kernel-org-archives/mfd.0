Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F14ED190
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054748; cv=none; b=Hg1WcDZhLwrdCUTol9yW6wHcVSe8JmlaLKiXS7+uY4zliI9Oh6W4VPupwFK5E59hjXJDdtSx1zI401FTCAVu3+m10PVyVXJjIAP8HAUg0jpKbpLDshaN//c761w0RAGS+qisErLw/VOnbrzRWO/lrHcQ+p4gN54Of8X9dRf8wIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054748; c=relaxed/simple;
	bh=CinbcOsRrU+weX/x8DlHfWVx496vQyqNGyiZd765C8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L72NzxbXAbY1aVX1kzu9/4yQRmzYOo1iMaW9ns67sMWnNER5j0hUHbb7Y0ks1UioexaT+4DxowhKtXwmfveIgQOPQ3XypxBxn/zVXR5vudk5YNv+kHkHGcVNFg/N/WEYw7rph3cavFyQ/yPtoqTseIOWu0byxd9k6EDBJsuOnjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGifCXtR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mp0k0liz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGifCXtR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mp0k0liz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wZVO1889493
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=; b=RGifCXtRCpX4F8XA
	ls0qBNylzApN/IOMej4NbtlqZIwB564QEKM9L62Lm+hEkjBplJA8aBEpBiJ8hVj5
	/LvJXWrPZE6q6QgzusbZ8WVYhBhpfrUmuX5HiuBYb/gyblPNst1XXhC29/OjnbwQ
	dIlhBXWyeVtHeFT0EFPVi259KbSFsBr5u7sOTYTXVPyS/Nqaikt72YijSSiRAIet
	VfuBB4db5E5RZBBpZpQHaoVVLjW9PabNIK32s4JAXcyaBbLQZFmFm2qKvZCo9Gex
	XVMRg2oG2RSjdGiayJ7x8v8jd/YinnFtvfUj1bYseyuK7kzTn+IvyFAlIh9FFFOW
	f9MKfg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda14xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:58:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91792488228so112362726d6.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054739; x=1792659539; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=;
        b=Mp0k0lizQv8Me0gokz3og/txjN6Xbtm5Pq3it49Sd6YxqEOMSDJkSmlvysFGIrjzR5
         UGSo4Vj9TUHGmWJJHYBeLjAe6+R1WIiHDpHvemrwn6B3W9bb8C5CauB9V1RpQYbXXsh3
         2vcx/jHPXrPCfwsAgMjT3ZSL/TRJLlCmR3xKERfUYYoZ50kmJPdBKEFDNS4H3wShOjL1
         qAEyppjdmg94vq0esN/2IPZL9YINPQeIyd9DuuQgdJ/h8SL7Fi+97/Y/WqIle1U5vzzN
         aiC26lGySmn8vecA/UJLGLiDyniiTtWDNM0MdZxVpKd33Sr46CNurAlsxmBrmDShL5gI
         b+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054739; x=1792659539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=;
        b=xk+Hhx3p3fYmax9m8+dKzzQzphR5x1npBvcqanfpskM1Mb5/MNM3kB4ybgEqWFVezE
         0AoGDRjBnwyXPRqK3QUu1jMbtawbX4XjTNVsb/1tWRxHoCPgOq8BKRc3CLrQc8IE7ouO
         n2/wAibT5gyyCP1mfRAI0E4dISGl1oBOxxl5B1eNthEhGLBk2j55IzndGBj+pqKJRzWf
         5qyrN0qSqKTFc2YvDju6kYUUzjsOIpqSBjSF+9NhWC/6Lhht+fHPuXBrU9ATbsQ7rBQp
         5vfT2usFeg65ukhiG7xJN1NzrxbWYkwuK+OqLnEhRW9GpvZQA8dW3+l8HgwBk4BqBT7V
         n3Ew==
X-Forwarded-Encrypted: i=1; AKwUvByRaON6V6SzPotHkdqsW2gVGKsu3BQ8X/3tjIJTre41WmrsnbN6iU0eytkEaswhV1F9lJI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0kOf7yutKNY5lAqGLF2bg9n4QkVanilx1tyiPI2H4rwu28lby
	PJqNbKBWKYwxuMAjw9Um/2ONekqD+B+mIjGwy+WYZCzUyeWOL1trtF3xdf9j1MU9gHcU8ujQ3+s
	sTv0OC/ENsfRgu8/amAklGS2B8dbJXOeOrUVEM1JBIyaJc75qbh0URD0=
X-Gm-Gg: AYBFou3WntpQZOVGRuMNvIX9NhLORLWu+bl7xaBxfd78VpK9LS7/2z2TW+kyGIn+slA
	0UYm1if0EfkI6xuZ8qaYLotthpvMJQsuq7aqz7JBKvqCU99kU3Bsrp5SQkw/ztCBJwxZCdpJUqb
	Y+HtaAyT7YtVvL2dX5x2/Z9nTjEkymMLL/SR2iHZ732Vhh58I7b/FOav6f+a8Kr32LlXgZZ+fCW
	nr1vLFZKUoBA2tObV04PyQDdOHOTE9Mbj/0e1XJBpWy1B+S12LAY/Uwgy5jd3a1vALAZBmNotZ5
	BrDo24pnL6fNLXNfX5qD6plmHTZQmwZk46Y/sURappChGviW69XRu6ah/EqSbk7Qs7q0YQc6o99
	UK5/MYNtgWwZZPlrZe47zN1f8jUz1bcI+mF7PYU+SDizsosOBpiGeL+oMQjPmms04xUt4UrCzCO
	TzGtQyurL0Qcph
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr3005238485a.31.1792054739238;
        Thu, 15 Oct 2026 01:58:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr3005234985a.31.1792054738671;
        Thu, 15 Oct 2026 01:58:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:41 +0300
Subject: [PATCH 4/9] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-4-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CinbcOsRrU+weX/x8DlHfWVx496vQyqNGyiZd765C8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXEzPl3ITzxisJqsyw4t0pMlSYPsdLWHMBT5
 voOcnO3kOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxAAKCRCLPIo+Aiko
 1eF5B/9YLyJIm841SYHHx7rwcbc4xMrNlKQYxSlfc3LF159sdBscm4twCToMomUy2BcBEVMFUtC
 mdoa1ukOkMfZz5w/HKjj1PmtFbnLx/D3Bu93+giW3zgS6l2EwH+qUkGwFJLvkq9SFQ38TlRm455
 0Y/gSXgT19PSELm2mrxTbo+uaxIfBzJyygKhU9NiJpiCAzWLItkY3dSyIgc/joHWGNyfQatevW0
 w7F9C7B5MM/1cl9cVnPq+OHUZA53YXzXZN0Hnut1G2pCe/7ffN+9sSQvhddiU3EJEp9EfiNxeu6
 jb30K+1QwSzPiVqd3KR10oY9QwWmyp9OaUlg5gsPtE1jqJl2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX4AOIYfWY0G1w
 PHDhSIhpRFpRdFioWGoj9i3dYdfS8lFKTzEt3V7WVUWi0OK/knv/S74RJAGlQt91nmv0yb9E5iw
 k6VvRZZdumNzZ8p8nXymOkrgERo+j+A=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad095d3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=l4xqpnzKx15mTiSKZogA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: qXNiq-MvziFPJVXBElDqFh3OPDplJan4
X-Proofpoint-ORIG-GUID: qXNiq-MvziFPJVXBElDqFh3OPDplJan4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX30uSqUa9QJvZ
 0VSa+0cIB6NMTb05SfBwFzjiTip7cEryae66+NE535zFOU6WEVDQZnK8A1ok4DELk4QPNZQXmcl
 qjB0KvzOyuA/QfgJMMxAWVCA/MlDCIbjfSInLzp+t1wHzOunaecWaX+j7efmQ602XJV7CPQl5Oc
 FPcg/soZoTcEnQp6DJqetQ1j3fY6uXquVPb2Kr/tWuknqBy0Eh1cN3++fNFyjXuPRPxWE8ogXwG
 GC61XTPoYw9HLmpJjgqrs4aP/sFB/bg++Ywj3vYizsPvJnj8YbRwcrteG9BuwoMgnhO7WV1hbZh
 sRQOJrAU78f96td5/xUTZOr3EwwaSzf6hylQQoXJ3DoyFQ7RyoLUbMqTLRjJ2ByTI4s52jqq5WI
 WdTG4ZG0KHB3DGx7L9asI5rJjSiIGOJeQdT4nHc9KsirajJZytuKsK8KGBs080+XlBCRBs4GH1f
 pQh1U1w3Ij0r88kGLUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

Allow the LCDB regulator block as a child of the SPMI PMIC node.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..1894fd82cbda 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -171,6 +171,10 @@ patternProperties:
     type: object
     $ref: /schemas/input/qcom,spmi-haptics.yaml#
 
+  "^lcdb@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/regulator/qcom,pm8150l-lcdb.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.47.3

