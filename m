Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0B4D8DAD
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341940; cv=none; b=cfictdikCYBDw919i746douJnpllW+bLsu+aLS39Fuma1OW6tvrbZvclDoWaXZF0X8ASemK+4IKPcs2O8wyUk4WSqCos9hMvhq8GHy6SPr3yjI7Ogr5uSxgXh1RsCoUd50njvJRxWJvhbkrDN7YennrPtu2DfTlXChA3B6uKYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341940; c=relaxed/simple;
	bh=RlYbNp2S/NZv47ECKrSIoSYkiYKDbdmiYZZE8XOQPr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BG/dGRssHhVFUFQIY+OW7fhCCECb1UO0b9obqYfkMWCUwYe+iSHn6dKhGzObUn9BdC9oQgNkIGkZSTcjlrTTajjM1HVOOig1DGjDSwv193Mk0KlM0gdl6O2WpA//arGvLljf4025qS3C5WaHoPikMhCz5nJSaYGZEETpg4uPGHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEBEjvNw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGPipk2f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEBEjvNw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGPipk2f"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxVcL219069
	for <mfd@lists.linux.dev>; Mon, 6 Jul 2026 12:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yRKVE6+HDuRkKaJoGIMm3hMcr4TYQvxtkFJAIQ65210=; b=pEBEjvNwhlEFv/FR
	75AE6ntaaDo+cjE9zeJPc0tRFg9z3KEvNn2sDMpG038HLDN/diaoXLolHmUP1hEr
	3arM67ahYMTcG3V8nXNhWAiEN4NmjXEWxxzVVBabo/tFT2+2AQ4tjpHlfTWYVAmY
	+xbmBYuR2n/bDtuDP2Mr3eQDXT5BrgiMeteyJiqv5mzdjEJH0yidapM91Hqnhlxd
	AtBHzIdyfOy0z3kt+e5tQOM38bwXAp9zivS0jvN/+DnccuD4uPZCewTvb/jSArUE
	W7auaRpL3A8EFHLyO5xFeWMBzjGySF8SF76ztXqsecNdCCpIbCGkhHcgmrSVL0kD
	MLSARg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs93e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 12:45:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so296118385a.0
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341924; x=1783946724; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRKVE6+HDuRkKaJoGIMm3hMcr4TYQvxtkFJAIQ65210=;
        b=PGPipk2fHh4q4LeZXd+ihekgdqkIZArXPosXD6klOgsZi6WeugJi53v789T7FSjFtX
         Lsx/J/PIKNHbGrgGh3lkEpuFVrHAAh3Rw8u5Ldpps7RpD+Yz4MKRobdPWBnVAPXInAGQ
         f2N2s6awpUk33wsOm9GKFTmZNi9EN9PDhoksKltP3kBr86eLjcYoPAoLQNnFjPvHfqqN
         QUseAo4P9egHWPZY7vNxj0xCbbwozoWYybAdpGNmqMsq/3FDxrhsWPNFCsAhLQysYE4U
         CDqP6mom8DEnWHmg+lS+GF7ze0wkGf/t5K9OSGu9hAXpyNK9dlH3HV/WQDU51CbQtkF7
         HbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341924; x=1783946724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRKVE6+HDuRkKaJoGIMm3hMcr4TYQvxtkFJAIQ65210=;
        b=k9M2VIpF8I+NrIVcxZJKnxaMaW0D6NaMoAk/OrDQYlrGiOmHq32IMV6R47mO5jcgoR
         fG5IJj4B1YRfH5CyxW/uKslEam49g/2y7AKmNRDIvERXEs/ZxqrMF5I1kozcATKI9pun
         sH8PUvEXkOXhtJq0bLaqpWBYlexXheojbpQtxLTzMk1LcfqAVDHuwl+gARxaSEW3JDWA
         Tonic6jOr10JBq7XWWVLcgHlZ1wj01mSCCowYnMUPKEByiMxZpkdujlM9ElkCOgOHg/v
         5qFjo7VoTox5xZ1S/EI1qR9F5IWqgZPXIauWiHjvcAEfumVyUPZcHPHJ8WhMlnMJP8CZ
         m08A==
X-Forwarded-Encrypted: i=1; AHgh+Rp2wq9Tw5LgaVwVcAQcM9vPXRpKLgTCW51SNTMISlHeTrG/X5lxNey8z+/EV6Vw6ORqjPM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFnrYOig3qoUmDZqtdZnbYxoQLr3YoyJKbAvQ5bWD1CeuMoHNi
	NrO5z+ENDx7EKH8csvT/EYgpz57FVFXQ8oC0fD4l/74ZpQ1IveSpic4lNkQpNIzYeg+n+Qq3euB
	xMThYbq9nV7XD/Hawfz33fbBPXjFUfevN8iJj5LsoCev2m7Sn/m7t+lk=
X-Gm-Gg: AfdE7ckTDKg6JPAnmcwrUgbNlTWJj2raV9znOa9HwDOMnFrXc2rTZu7o14Vqd7vRX5T
	cbGMg3G0ebuzrUL4N35QjvkimDD7r7hWwRM65BaRuVmOZjP81c7K6LXa/oyf3zBeZ2x/ozUIEae
	+KpcvygyE/7uWYUmk8vtPVkQyP3ui200XU6EJ8edm6xRC5aiDnAZJI1jPWuUbMFVtOHhECfQxWj
	gdhXZK74QlD/4ErKV9pQT8PkuCX/MxDCemrZ2fZnaKuJnNRixhjZAYeehosydDJjyR7phSmUPhT
	VuTg3i58/CqdU4XcFfcVqkd623GBOfz8B7iT6N8cVAmxk6y61lmoAC3dV5eYcFtoMZHaniRc2ZY
	H9/s/qWWCZoOrAF2BGyIOfYnT3S8GdoJ+3guZTpjS
X-Received: by 2002:a05:620a:8803:b0:92e:9d63:a6f4 with SMTP id af79cd13be357-92ebb4e3acdmr52344685a.18.1783341924018;
        Mon, 06 Jul 2026 05:45:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8803:b0:92e:9d63:a6f4 with SMTP id af79cd13be357-92ebb4e3acdmr52336785a.18.1783341923456;
        Mon, 06 Jul 2026 05:45:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:23 +0200
Subject: [PATCH v3 11/20] pmdomain: imx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RlYbNp2S/NZv47ECKrSIoSYkiYKDbdmiYZZE8XOQPr0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M4dqtScPW3ltfTa349WlyF4Im8UV3+gbDjf
 +ziQYf21tGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOAAKCRAFnS7L/zaE
 w6cvD/44iwh0bO9U8phWJF64dOWOUQmSK2XBLJBtOsastnOKG3frrhIUgQnJ6slnJp9/qK9Sctm
 /VnPVLzutrQEPYTnyYTwegxzfw7z65c+lpG66v6oMVhuEL5dLy/ICU2X+YiF50ymdi27qbZl9Ru
 N7s8Em7rQs4VT53ze/irqmQe+MI5duU6f4NajzV1rW2r+kWg5CJMcrHSndCLLP8wwPdl5R7y8JS
 kYnh2IA3ZdI52TAByyucQlrH1mIQAaAOuanxZRDHGxuaXM8YUtSVvXsoetlgqxw3DCNvaY+wc/J
 DdF30T9KS3cwqlGuzq+vdBBLwJR7LQwXow3VvpGPl2rWjOtJgoygngawJ04/2ndETxEAoD860kW
 RbjA/OtAOe90uYdXCO3LJPTU480tw6BXD/kUFLl2WJUNf03mQBP7TTJDtk+NK7++D4AKFcce/3D
 v6HyypGAdrulGTOBiI09UNzWl7ckMWOWTPo5tgWmIyqOX+keqQXN4SVa8pc/aXcw1oYzaJYvmIE
 1oSNBqM5iMtUohuyDC+ESCLz/kypyOfkI/75EzoaMoOfyuD3s3GW/kC2KQT/Tc0sVNfrEewGFs8
 YrDIoeAOIWV7FEygNZEpjcznlFCcN2Ex1WrAiElKYvzaqDhVa99OdUeAEwGgNXIU+kynK2Czoqa
 wT5QHhsSQJm0POQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: u2wPl_eqn5QwEBEYC8XP8aRHInv905eM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0SzC5VyDG6lz
 M44d1eomAZqa3BzQo1Kvj1NQvrobQYbALxwvb6Aj4uSeEWTUnBZ7BWLaVyM4VkIJRXjsuVkPrbN
 N8+TSZKq50k/bEelcRv2JW9o7NPVnx0H9wRwO1edKKS0RmDkT/hk8sidVuh4l4H0RizxnUaOoVM
 SlvF06MVcjfctV3zdLyfwNbjsvDs6wiTzdjYMKYZ6DZ0b0RH0rnhmTusrTw48jQUVfk6U211xTE
 dKjONUhMASI87xshMLsx9jdTAA0Oh0UDI8HhaI8cabt/sMoIn1qo72j7P1Y+ryYkEKiPIMin4S4
 vtBVO1lYaeR7b2HmIjKvwH7EZrcnWRnm1yiVFzzBcvQrsYc3YqsjAcnQ8TZjIxtfEdkq4tBy/7A
 TLCH5rA3jKrj6crwxezgEU3NPXJyDBb4wyhOksB8rICoekqU0Rt3Y8FLuMd7CfjfC/ALi3199Yc
 otFCeXY1CK6TKXS/PPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX7eHpqTxJ35+0
 /UsMmwc9SuNbvVQDX418HS3MgG6f+JfHRahUCZ2UazmsHDUj+e5IOaoxlfjKuj8q31kwvL35w19
 /eMoY+snWJJI15s22XOGha7Ht/hXj2I=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba364 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=vTWqO7tZ479lFkmzGCgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: u2wPl_eqn5QwEBEYC8XP8aRHInv905eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e1395c413160c950 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = of_node_get(np);
-			pd_pdev->dev.fwnode = of_fwnode_handle(np);
+			platform_device_set_of_node(pd_pdev, np);
 
 			ret = platform_device_add(pd_pdev);
 			if (ret) {

-- 
2.47.3

