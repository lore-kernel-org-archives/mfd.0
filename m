Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D268A4F30F7
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054753; cv=none; b=qTK/fXJr07VprE6tcg85gE1bSdXPyAJqJttR1Lw3QnFvRlUDnkfxWJc6sxhbKZcTUw0yLdYZtbiHGK6qjehtyGdUNlAIKes6m3ouS48SxjYYsc2u7cDd8ViU/qm9kOyxPJqlcDLs3w3qY8C86ZeUJnQI5V9XJSoc6DvL6z8X8Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054753; c=relaxed/simple;
	bh=xBbaNwaZ04U9vu5xMLAzqewhXtCtgpwBmq9365lh0RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWmEeQ4tud+ZE0TeLOASn5nKrGW5hbW34+1oDx89zQxbclcOoIfPmDa064sWdxPq06jVWcpwvnflOIe35tp7xpKcmSRZNDYDp77+XHqOBeylq/RNiRsjRy9UwDJhlmOnHnNkHt+xXncVEWCz2pxn/KoS7kMZlXEnd2riMZhdKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cf6dno0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iheEkoQt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf6dno0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iheEkoQt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6n6K71682649
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN5oCd+hB1kN6I2RUJR2/JZbM+ngr/PeEqa7S6xoQS0=; b=cf6dno0ecdLTK9C5
	A9+Xyr6WvOyg4SDyK5jrG8l6nCbmLIrxkT4PaHQ9Qogaiq4Orr3F3GXJoRU2MUWv
	f0ia+l61o/NzIyDL91yxDby5fVZlV+MneZA0ZUq6+N3IRDEw7nAURV5mcw9ODL62
	iiFdugaMtjEOFXHhS0QDoe5rUUSqoetFPJev9gJ8dhz6KNLPhZ6WiGMDpApngRp5
	ebl+O6j2b64DGNetsYads+vF8RSpc5Hk9tqPiacO+xGJnVNon4tZvYBD291tbg7A
	Lp/R/+VGZuneoQQTf0D+dJGpSkrbEHOXelcipNb8Kl6WYqbi/RdWiF6dhObq3653
	t7p8GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03nwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46b4b700so224093785a.1
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054746; x=1792659546; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SN5oCd+hB1kN6I2RUJR2/JZbM+ngr/PeEqa7S6xoQS0=;
        b=iheEkoQt0NYDYE9f/JG3AXLI8Yre1ehbH//Ok2EcAu3O/q5viEHNgQ2TqX2bbr7elP
         CNTHyHku2j4VTkzFGEMffJ3N8dMB5BjIVcEa2+QTytfcD58oObrGTD5oONlTZytyj9kF
         uEPWgkZqH6mXVuArspdR2d+7kPThW1Nya9Nr1e7tm+4eu4TmcjdyzbR3jBLg8UC/R23v
         JfWqN/5HCpqWJKHAPFkbRZwVec38IdC3vYTGP829ydUWglNAYYHbJhpmmhqrH+gZSVSI
         RDBW28SEABviJA9GtP+eoTr9ojG02tE4gEIoRNpJ1v/RY+eQKYtm1WS9CQ43Xz12szuI
         SJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054746; x=1792659546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SN5oCd+hB1kN6I2RUJR2/JZbM+ngr/PeEqa7S6xoQS0=;
        b=avr4uFYwhOGHrzxhPgdGdizUF7w1z5FjNQ+0HYZhLg/TUd0Vw6pnuVztvkLvdcOd7c
         wzg0N+i4KtzrhgLW5sDD+c2iHhSXBz3rjZChlJcJv+93S9dYplIhGw8J4uF3D1xI65YK
         9oTu1D2+5K3OA8yLDQiL1dsqMJY6KTQUJqB/ms1rl6/gX/Sqx2kyYwc3w2OTiBVnd0Lc
         Ca7iZGwWE/Dp9dOj87MDmxwrWQoHug2MONBR1DxfTvRf9HoE+6vLQLG4UyBmJHpKOLOF
         gmYe9bDW0qn7GmcNngx+xGNHJCt/vFKTpTQm/1zJ/+UdORLzE/5LcYm9pCKdIsiWz11y
         EhUA==
X-Forwarded-Encrypted: i=1; AKwUvBz3mGQ7rEw/kMBU98/N+lwlStnLDDHnxu4w7E/ZaYnZXpSQnVGjMHamaYBMi9g5dHFJs5Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYJsdao4Ct/3mntBcUvcN/afN6wNqnUVT5d022UmGqLsJ4VeIen8
	zNoYlesVX4cRjL1YlOrX+bierVpQtt8AU/oBKTSUSVWEfDBR0qBS/9dseiSbCQlDsVPf/1kIcM8
	7IS+9BESELCSp4UYiwZs8bwKv/arV1IsyDr8Gq052XRzKLz6nfGFttcI=
X-Gm-Gg: AYBFou2ae9AF1ek3HK96Q8X4o/ZlRRsn1cUtOn19eyRmSG3sUgux1uuXvkYiQ1/uEGX
	RdPal4gI+LknKCFPeQM84ssZDYLsrFjJtUd1ft97o9P5MfBdRBrsyHNtzmqLjxFxOzR7bcyNZvU
	Z3L+5A6NbtSszgUKJv7mFgr1lp7xtP+QJJ1ApaI3Zne5g0poKrwa6g2h2/fUqi4QcsQ0j50gtbL
	8XnLp5EOY+ftpg5TmZ0kDZuXSp67E5XKS1ED33o/IKhVre5QtAZ4QPS06VYZ4MjGfsTVCX2A3Qo
	T2Uj0IEQ/GdDYy0IkIE2XNJc1eJMfgk8DqRTsHuUbwr7mLoIMn+v+ol2DFO9Kavb/UFjclKP0Cv
	j52K4gR57S7X5OtiUcmbyLRb5mpeYpSuXza/mB3zdhBSMpfUWYoVQ90wJppvFfICAh5XiGsNB+C
	xebh/1beyaTBOv
X-Received: by 2002:a05:620a:6489:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ebd20830bmr2693241485a.36.1792054745960;
        Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6489:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ebd20830bmr2693238285a.36.1792054745505;
        Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:45 +0300
Subject: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xBbaNwaZ04U9vu5xMLAzqewhXtCtgpwBmq9365lh0RI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXHgIL+ILyWEGstfQf8V4lw5nKNfZbOlQ6Ls
 JoUbd46i3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxwAKCRCLPIo+Aiko
 1VJaB/9k5Pu4lNZ5NrTjERYf0kQUmOOugVGCg+f56hXaS9WyML/RdJFoZSw1QgeWJdCZU206QDn
 TEmCrYkOuwLEFluHrqIzBvAZXz/Fs935E0zcQHI/E3uR3ISKlqR+urAmffPXe5Yb2kVytPoGLfz
 WNz/6sJJ8FHkVKmYSiGECHcfOVbvoR0FnJfwB2bSUBpqScPulDIKRQqsy2r7sRaSrMuwEfoZH2o
 LCSMuO3uBfZzwtmMIirwn4v3lLlHY01VYpGnxf65IOu+KBbqpyyb3hxnLwtpZYQEnguJ9eAXq1f
 fgsVo5CWGYYnPYNKZ9s5OLZztUyf9lJY0mi6Otj8qWRp5/QY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad095da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LxeP0AzRrgEWglGlbvkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX76BXSMPR08hL
 W3VRvwSHtKWcPa71MAisKIiHaHuYlzAZdm7zXQu/rrub8c+U5Q9C7xRoa/AYSu69gxSK5KhWSNS
 t38twj2Tg5TwCjqzoFmHSi1hyCvKgtE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX0CyLr129G6DC
 ONPo2wXLnQw7wimEMbBzrM2bhhLUHoTuOhGKsxX4/SdVOfm0nIvoRYisQEM0UnoULr+ZRT/KrRh
 RUlTQlo5q1D8UjisQF4ExpTGUTRAZPfXmRHYp9kjejYJH2ivqFJrRELb53JB5a8PnEQK40mqY7y
 j3UHffmn9Y+YQaYAJNtUFr6ZkOkti/T3Lfm3Cev/eubtc1wxOfJfUmKqlL+/SU2qUDdP7JxF0Dk
 jeTyIPx/PrrI8GvcDvfJPoq1rCWHY2Jet6iE+V+N83A9vPqYgTbwq37RYHKHOWr/4f4DwTd0IE8
 gmCsEprzH7G9S3lYeZXke+BTovVjfHMyZpPfLdam1cqmWeuMiV63KVU0PFcNb27vZWMv2zjB0Dk
 edi42ldEqRL861VhJRv0hIrM5boKEvKFKds6KfTPhwMA81Wc0yVzPD6Ec+gxIR3oHN3N5TQF4P+
 tMtsDdS4Qft1IWkdnmQ==
X-Proofpoint-ORIG-GUID: N8WETF084JLsHnchiOHAxaEIPBiwX-YZ
X-Proofpoint-GUID: N8WETF084JLsHnchiOHAxaEIPBiwX-YZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
the wrong address the mux driver fails to probe, the Type-C controller
and the DisplayPort controller keep waiting for it and the display
subsystem never binds.

Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index cdced5c848d3..8f4ea981bb89 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -434,9 +434,9 @@ &i2c4 {
 
 	status = "okay";
 
-	typec-mux@42 {
+	typec-mux@43 {
 		compatible = "fcs,fsa4480";
-		reg = <0x42>;
+		reg = <0x43>;
 
 		interrupts-extended = <&tlmm 152 IRQ_TYPE_LEVEL_LOW>;
 

-- 
2.47.3

