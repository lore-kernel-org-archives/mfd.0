Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652433D4135
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539555; cv=none; b=kynKOrebOPzcPOj7yIF6vpORp4hfT6rLaHgMy1MPL0huE0BHzX5oVx1jDP7T5nxbvwAKp8dWYvSgmViA2qjmX/Dytvmkl/ZLEFZg90JqDKvnXM9pND9gS5kOedYSFJFVRvC0jyccpgLaVC9/sjwvU4e9wVXvQGzPQ9S8CsW9nzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539555; c=relaxed/simple;
	bh=A6rTQywiVuri+akWPu8ZuzmrgFMwkmEBL5RABzyTsAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEoGeFgD4fNyp6G8DjP+dszGKaIO7totmH5+cjsbzQx1HNHMXzS0yDNscmyg6X7VijuMWW+26itzh3YOboq4Ek8+VG6yhOki+7ShtWSJFzyb/EVUB/sIujSKXFtGWbS2TQmNnyguqOtJ8WfmGATsj5DmHGYJoFx58GrJwmngq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTX3r2ny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uxc0WSc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTX3r2ny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uxc0WSc2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K97aSs1653589
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 09:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azoonAs2rZvyyYgYMRjUol9O+q8eXf7OwF52OR7cKds=; b=jTX3r2nyWsHMgzxn
	8FiVrwsN9vBocFeW49l7ldKA5XAZhAJvTnfLaGPyMqjBxsPnKZBOPmOYXmAuXLVY
	4sWAiXGaTX45boKk1A3m8XsO7Gmxi/ELddH67Z5gVDiX05ykqVAhWHKtR+3LGKie
	veQisNX1QTgE8ROX03T0wNSpfnKt6iykthul2wHTYqiKsUZQS+FSKYyXOCuBYwzx
	FP7tPplooLKcPdtEWKezKg9RXkJ/Rf/nlqNN+bdT6uAg8a8my1SerICuKrd5eD+U
	UQmT5/Vq/x0vfqtNbWmWRgO1GD1kO9nqhZUuC2tvSRXW5+IyGky9YO1InCixmuof
	tFEEDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs502hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 09:25:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0ab07320so136279151cf.2
        for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539546; x=1785144346; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azoonAs2rZvyyYgYMRjUol9O+q8eXf7OwF52OR7cKds=;
        b=Uxc0WSc22tkHCGjCjfe2A6/8jjW6M3lAcdG8lirCo4ASjcyd47NcVFXjoo48rl67j+
         n8Hx/ZOwetfZdybdWXUzMqO+FgMpXHY440qArNbk1HwUDnz+epnjoC0p7PWa1f+0F07n
         YyNnkH3lEE+JiEE4spL1f5VP6dh1hbCdFVCg09JRRpiKNo4eSz9MX4WZiIBWU+dOLKQE
         7xABiegiQumY8t0gq5qgdP8Xr+3X1Ty7WF8/QwilYbZpjieWFf81DH6eOSPyIUmOsgXd
         5jJoUdnkb1v3UxY3mO/LzaQ6p/CujraPbsqo2Kjq5hRriret7J1GVkOXsKo85ZbDGCvi
         dD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539546; x=1785144346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azoonAs2rZvyyYgYMRjUol9O+q8eXf7OwF52OR7cKds=;
        b=AzSQzSiWEz/F9VxGOPbVyUL7mjRu3QxAV3E8UN74xyEbOECQYz8Mlu2YD47tnJ0IId
         wVvZfVtfMbp5NkZ1S96GenfBiZ7YrK+9o6QovDTFZUTGSs9sgiJi+y6JakTLdruF5wVI
         rueWdG38ZK6YxxKXzRDNZD3mZMQndrqr933GZpxDH7/KLW5vL/shSeFKBM4tcFFrAsqu
         XTb8bU9EeFJSxBZYIgO9ZV4EEpacmUkvGTJmjS7cspICV3KxWXREPWDhr24WS1YB6be+
         DXY/KNRl4z8vyW9DZTha74H968R0LzIgUUCKgOdvSfZ8VM54NMKI2cBe5fzbFz9fIMno
         nrFA==
X-Forwarded-Encrypted: i=1; AHgh+RoPw4khNpbrLhD9MCxMTzDqFSM4T2lbnKnSvqq+t1QQXWATRwUQYjOdIm/fgElCs+H3uus=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Y9JCkULKINwOxPjZ20zdwXla9w6G83ByDq69oszoxppkt3DD
	WMdd70f56+51Tvixo2PI4ig1s/bRbX1woVy9WFx3D8Sgr/AJILwe14ydIYGVs86cs+C+i8oqgvI
	vswmC4QCPes9kI5/ZmuQ/xJMYum4MCrlaKMDnVHL68/Tticm8ZDCPpII=
X-Gm-Gg: AfdE7ckJ7BehRykQ4aTgV4o1mWrzRUc1S8cTnr2cbF+Z3SmXxVBVeK6LksgJ7M6wJfj
	s6lYmu3tyDS2wo7grPBkA4yWc2iNvTSsuWI6lOdmuYYuhoqQNnTcIXerAmo82zaeRgVvxN3YAYz
	KOtPGmM6J9S88QqsYC8ZcrszTzHRbKByDIZoOMgPWjzy/QOOThtXoX7a+trANPyj+pOtlQyPixc
	wRu7C9TmlgN2mYcx99kOR9vZeEEjlZosohTRcvNIg+QaTxOAwqCNNcFjk8rPJxAI0gDP+xeDtBe
	djOFt9j/xxFiGhECy9h4eI7q1GQ3O+Tilm/9FpaUzE9bsewfqg3V8PFEqOM+XVaNeL7o1GVdTxN
	TI7kkkyaNNWhEXN2saoM3BiE+74CkBg==
X-Received: by 2002:ac8:59c5:0:b0:51a:8c9b:649f with SMTP id d75a77b69052e-5213d0c7347mr123946931cf.67.1784539546661;
        Mon, 20 Jul 2026 02:25:46 -0700 (PDT)
X-Received: by 2002:ac8:59c5:0:b0:51a:8c9b:649f with SMTP id d75a77b69052e-5213d0c7347mr123946431cf.67.1784539546190;
        Mon, 20 Jul 2026 02:25:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:53 +0200
Subject: [PATCH 6/8] mfd: tps6586: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-6-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A6rTQywiVuri+akWPu8ZuzmrgFMwkmEBL5RABzyTsAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel+JVh2LLebfg0Z60TjK/ZqooFO/E063bUsn
 DcFFoaXAHyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pfgAKCRAFnS7L/zaE
 w2/uD/0aPKY8tpTuQyVi4bVwQxAwSe5GwjC2DtgnMo6nh/diKnBHmP8CrS17h3oxzaLBbpoQsyv
 Sz7j//KhI2uvM/6lsN12ObBAmWBE1OIY2cI2EITf9uARRqijYfV+vh3K099Z2WSPyIztcA7JV1a
 LXzZb7ugoqz2dMzT1dYxuTYTKlupbAIUqn3iCnldu412Ogk7U1TlAiPXUx8NUiwcSTgNJH6JtjG
 ybhBOe1z5foPXCLYPHg/mB/yn58+1Cndf7uN6COgbJKsYybBcSfm7GwhrfIR3kOESCkTPUQ/wKa
 CtSLDtJYyB3h0iOJVjA1wxmvViV3DncYABZdM9JhjlGr5xekEnOEIkt5J6dyoA6W3qAdQfM+wDe
 WHnnp/KwxzQBF0DZMHAzzpoGyj4CiF+A0L9ufwf2uDn/Gr6QSF3i1uh7g3B9Au9fYk4fZJVPzjL
 EreBD5gpBiQV4/muSmW+73v2B/YzUR/9/++LXGtpFgoyz9CAYZz8Hc2q0lwgczqGG/yerhUZ7Iw
 2svI6neY8mLXD64gJd+3QIabFLBehBoppvlO1WSrRtFtjFWC6wlYnhuX3lwh2ugV3XC2oWE+fzO
 N24Bq1v0R7mTGsTx4YHFYiArfM737K0E9k47o1YA1cm04PfUgXMiuD7g5S8kXEV39VNN8Mvf0py
 8hgioC0XlGh1TYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXwsy3/M2SpbVa
 4NHdyfh9H/wA3wWiiOIyri2Vp8EuGBV2yfWZz0C1iV6LvCaXaYEI0YHHxuv1mTDoePate/zth/e
 x46YCG64bV8pbeqMDIPwHTwJ0UH6fCo=
X-Proofpoint-GUID: ryctbR7pA8G43fLW-EanUOSAs5Mf4cXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXwCugbgZ1iIUx
 FO1dNYoyP96HItAeR0aFqh1B40aZnAF0zAbrYA7+G0lEfG0bI0qKl0b54W6y/RkVyxarf4n/fxV
 g0PcUJmySH/0t6PpBk//DK/f+j7XyLWWUYNrZNnseUElK+FG8gAZHW4x8PLVau8myFuwkw5/BWY
 I4HavShly5jHixDu7zjlpe2L4c2+my/vCRYI4XbKhAwdW+RwVNK2eFoBnRueY34AtKOqIR6SibF
 iP5qZ3QZOtiN8Tlaoq654eSlXofEx8UJRpiNS3m55UXrFL9lS+c4DyBHco0g/9zC8r55vGh4XYL
 YIHy3pfkk8t4azKcNOry8keKN2W2uKZqieBp/o08NBe6JW/BBuTlUiVhzekcVxGkLFzVB+Yb0AF
 NXWHSJfJo2zYJ39Gjr9sXOrPOqeNR7q3ZoG/ead2kR2L3c/pfmEkTxFmhprYCOmMFdv0/7e4Dim
 g59LcgSW7V2mT89UBcQ==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5de99b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=s4_jwgGKpBPlvUtSdncA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ryctbR7pA8G43fLW-EanUOSAs5Mf4cXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 3cfd2f02b62f3cc370e0d970ec2643b638fd0fec..fc7c4b55c385416741925904abae4fd240f55b13 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		platform_device_set_of_node(pdev, subdev->of_node);
+		platform_device_set_fwnode(pdev, of_fwnode_handle(subdev->of_node));
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

