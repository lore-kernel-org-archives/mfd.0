Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273FB437877
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342256; cv=none; b=F1p1YjMcpJqb69590Unowwigr5HIHYs800+hnfYbIYp+GRtHPWhg3H983N4fDM0zO+6dEVbNBeFCiS1gboqJwV/jGbB8mmm6dyJiI9N/76GYJ7FBW+gNjtscRPJJrRDH3LNHxoJX/9pxFQx1JWeRW0OSLC679TQXJCQ6fjtKsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342256; c=relaxed/simple;
	bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIhV3N+3K4Mp7f3aEyhQE6H1+Xws/i/PDPzPlL++iRbRmQgeBLBLC/YHF5DJpRIOq5REs9035fe0YVJELF9dw78WrOjHcrWFXZ8/xTy/3YmbiTxuMxLV1Fwpkr231RSd1I7jz4wtQ9GW+9imE6KzgwnrHyr2TaxQto8KVcSF+IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJEEF2hq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUaW2Y2o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJEEF2hq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUaW2Y2o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxEPm401617
	for <mfd@lists.linux.dev>; Mon, 6 Jul 2026 12:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=; b=mJEEF2hqlR/uOjVJ
	VGxfq6X8Coeflz9gG17PG5AS1d8bsHMFXhdZWsQVpoBGNxPvBhyMKeuA+dyOCDVQ
	f1hfsjqCoXOdNFPJoAu72h5EhTA2RJe8aHAuVR3do6hcY/6XuWdPi5v4ABh+SBK/
	rcNeX0qyntCP4cdXULNVaYmo+GOzB4IXw/vS1gy2FdSZK/epGthEs0eICwD0JDHC
	qLwA7MiAX+whloAu+BOq3pVZA9mRrwwWNHrvcFQktC3WPAB1dKapRcEh1XLp4aGO
	t0DPDKiFYVlnUQvHVG/TurGAk+efJV3NTROGxUtnqQUlu+PHgMshaUYjPMuJ3IBZ
	RMPGMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grm6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 12:45:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso328987685a.0
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341951; x=1783946751; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=eUaW2Y2oyYoxI90e6Aawwrhq3UlAOF3RRRiI7iGfxjAJWAqQsAf2cFaSK3R2oHgmIA
         1Z4Ck0Pont4PvI36KdGnXc8ghAhMFm8GrIMlTEehhs59dB5MlFq7+Y1fNi0eFZ30sfvp
         ZNozzrNNei1kan467WBGV8RRTeOGPT9r1dA4CGVmVfrm5UdBEZUBVHye3XtZfS56VQj2
         Qcp3SPvyozKtZXdyRlXS6wP04UgHXR4F7knr8OY9UCsqptCB4xFJ4LD8VzN556fPxCPW
         OxQCwiIK1Nx5BMHiB+P0jRurNzptEj0QfpfCsW0GyrBnJPSV6oJUmRKWkOUbM1Lc4Tw0
         y+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341951; x=1783946751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=fNjaV8g++8Slv4zM7Qn3UAq7YEwRzOK8ybA5GcqoBB+7ttFrVJD8GmClPCeT484cSW
         SBBcQ/ud+WGJB9y0KbPmYBJJuPPIFy96jXUym8WSel+wPW1Bg3KwLLAcrraddM2/PDvQ
         ciR2hOlv2LS/e/ohtWzmx9wwOzdMvyc3W7mskG+VPxug5vor7iPupOl91TKmLXvJBJM6
         CcD1bZJUJiVolpl9LVHGDDszLK6gN8CR32P6JK9KcHkqvMSm590YvPpqeJy9KL4SOwQs
         G43+/syO179QC0MH+SyU1QpvJSIsrGu5cXnltoO9euXO9BnwT72dSUT0UWZ+RoxyhPb+
         exgg==
X-Forwarded-Encrypted: i=1; AHgh+RrzfUwLeS9A2ylXYQwkZ1nLMgsN4vPfwrI0WOaTnCDIbZEamBRw97L4Z/HVC62wKXKfC+k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTd+1bDCjmr9oqrrSg2JRHDLzH41UmR003gghGIlYzgMkGD/IL
	TtIGw7DD2EI8zMAwt+MBPLPItZxL5CjjMPoP2rsCJpORlxdmaGp0wXvayQ7V/bIGBZ8prZhsbqv
	+JWWxDe2HV01sNykqsey2/UHzbSbr/nHLgaT1YZ3UDmdtdLsVYYUZ53g=
X-Gm-Gg: AfdE7cmoU7Ei1Yeu1hsusPaykv0Etg7svJI5vCyQXavedJe/ZGUjH712XwipyZ8yKyK
	wDUsWqFkrxt4gRSzJO41Gek7tGfYc+mvvR166lLo3YnT8/xC0+xibZY3/i07WLXMs1jVn6DcScs
	EzTobqbJ10Oe4z2IhXAxIHzGkSeDgXZjgl5J1Y7WmiuE1bNDrsxkA9Ueir+NQ+OjkSS9b2LN0vc
	2Ji8z4poPLrpyH747Sc8/pUboplQYz6WM2WxxCV8SL6BEziexe4S2UFG0un9K30CFFNGQK67tL7
	1w7fDKs+mFjh5mFuzMF4jhjWKCd5/s5PcKESwP57M3sue6Os/kFNNjnDxcNDV/BaXes1OF0uFUn
	FWHV/CtHMfXS+afapg4nF1+ZmA6Qlg63LS7Xh2U8m
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749181785a.22.1783341951067;
        Mon, 06 Jul 2026 05:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749171985a.22.1783341950261;
        Mon, 06 Jul 2026 05:45:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:32 +0200
Subject: [PATCH v3 20/20] driver core: platform: count references to all
 kinds of firmware nodes
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-20-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M9ruJ8yyUk+I6pdpFWbcAtYm5CgsYvefKU+
 TywqoMuS8KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujPQAKCRAFnS7L/zaE
 w0+BD/9zjT3fKJr7/zYP0sHpUApNtRCsyLsJzRKuAlcO+cogBO21GRQk1DGikSTFqOqALVvaQ2g
 83j83HjHg+bMyaUlGN/FEHSMVHmKvXmesanFWRUyj5q/cQcFMH8POK0Xe3edFHZZx4BBkdJLCiU
 YBgV2p9qKU7Yx9ujTc0nbFflTLCPc+KLCa6XMeNIL7NcRgHVvMgBJocHY4ppEVSl3w0N1MqzNLN
 MJ2jEc+08OGTNE6VqBsWKGpcVcsy0c/flgXequGSLwF2lbMvrEVBeckaXblcohUFBgsZTwHIilr
 DuAyyAxwT3CWTsisqCJ/uzziDpBphBHYSMVHgzJR0EvF/dg0gFk2JrYTFDjipwiMhwshuY4pMG6
 brBELDRVNzWmoJxvrqtCNEs2g6/282jmP5bq8VSGXsiFh0Tlh1WMQesFTI3Dru/rc0SNeU4rkul
 wq2awNwyKdDtNJtZDmRz22Vrcbh76dcF1Halbc2omaKC8QdnXDZFTtncn03dXnNqBcF2/RucoRD
 PgoRvdtJOI/EakLR/ayb7hAHHB2aey6mLr7a280QfJRvxTxQ9lcDY4ZxG2oeQyo5EJpmBhQCPl8
 BmnHyLd2X+djvXjF8tGCWMjxCty1aDjcqXp8ApTdwR04CWKI/ZYVFf+bcapravEbsUypfWAAx2W
 0i3DMYG/6NOmHjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4arAuueJmfTrLzAuvPo3Y_IEGs_6nuP5
X-Proofpoint-ORIG-GUID: 4arAuueJmfTrLzAuvPo3Y_IEGs_6nuP5
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba380 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0v3QZx3SAd5V
 ol/+uYIV+ceF9WlKKRO2Sh+CtrpkbFqzW0Sq0nnGJU4unyuoJTCc8WboziXzHGgR/h3ODSINecY
 gQqQd9JzX7KU68kJxNuBXDsAc5l5mh1cfnGrCMwdB5CSpRka2iSKJ1uYLbqTSsWrF1NiFEzQ8vE
 q7GwEHqmn9ruGfDyAB+32XgJGA2YDPHDwUORYwFukEEXMV/ZBFgMf6a9pBiYQo88YkHogbAzuZg
 5ucwiNGIcDKHl1mJf7XnVHadkaZz3ZKCPjM4GQA2WKQf+gvysUNeo6Dj7do85z9dq1XL+BhG3Eq
 LnAEpOOiXXGWpWrD/Xgg2VFB7uuQjVkc45Y+pdMNVkhhlZCaG1CakPHKFHxwAu3CgB/sy3LPO0q
 4QtWyboDgTkpggx4kqDNtnUX8T7DpMStORgLHE/wPPExDhYIpFtnCE9LcbmTYxnFy6zuhzr+amU
 hpIFEUvqNdVH/2VnEsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXxBgAt4EvytgR
 zjj5emocBuYSXAY94U1CYc92eG3OPu6nB12+vqvc4fg3KnfHD2I/0aAq4onkQTfvTWdIzbng1Eu
 11Fh5X9EBFaoBOF9AeFOp9wyulCh1jY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 9357942d0c79b032645035879b2bed3d53305b9f..a71015f1d915340aa01ebfae67196d4d7ccecba8 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -712,9 +712,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -730,10 +728,8 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -928,8 +924,7 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	device_set_node(&pdev->dev, fwnode_handle_get(pdevinfo->fwnode));
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3

