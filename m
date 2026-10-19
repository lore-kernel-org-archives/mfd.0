Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9EB483825
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409157; cv=none; b=k2BiDIcTbMv287VdyzgrD5qfEQ/97GDMNYofGc2bA1ZSiuWK83SqW2QNyZ+rC1SoNtNTRHHVsyNQqZAi7cb1mswq4LxzSQ6NJzboCyXCkEoku2OBT5kGIPhCm3yywFUHg2Wc/2OB/bhudWN8HoV58T4rQS70Ex7ytnD7hrR/lVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409157; c=relaxed/simple;
	bh=CWiZ+B+DX/pd1HPJMvcRWesjFuvAJAW1/O0irKFh9LE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oDYYpaGE/ZDaJ+xbihBEqdRYC1ylWCogRDEJiblD6GrmiMyxAGkRfsbgJoqSFvlS7jUJtlarHxmtsV8MLn0U6XqBzeYxbnEFtvfTjjIBY70u3cORXB+IQTqQckzCEcwsSklkR0cireTv9CTo6zYpkt28jTgNz3831LW0ryi4uJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiSRSgE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoCgWC0F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiSRSgE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoCgWC0F"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrJR1665443
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Hh/Ql9nrQN77Ly3gXCUeGT
	tJgIJ8Ua0NJFTzN9nXRkk=; b=jiSRSgE9+fJbgiZ/iPrgRY/hcqaUTEAFjwB19Y
	cSi4YnItc2vLrVCzXEHNGwPaPM2pqLIG6/FBVqAW6wWhbeQSaA0ciVD7kRM7cq5c
	agdHgwybacm5aYDqtNKE3hqIjkg5W4XVXj2doqUsBYb1Ich4sQUjBeamlML9i8Ok
	UBPPms0NPpLUS5stxvy2LgJN3gnCiACkI7sLy7PMHxDB16y7PcMPItl2QmL/Cr4W
	fN5pyprkwy8wcAS/4Bn+WCt+qVAShs22WnK9SwHd7PODmYzILz1/50wO7YZ7LEYD
	l3W9N4dmmmLXgQc5iyT2admP6d0nXoL1m1EPN0dy7K4CtNng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0tfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso487064285a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409150; x=1793013950; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hh/Ql9nrQN77Ly3gXCUeGTtJgIJ8Ua0NJFTzN9nXRkk=;
        b=EoCgWC0FxjNWF5hJutk0myBCFYe0P5k84cLY4lzZQ/6KqKDq5+MsFkuJ4AiTcxtILu
         VkRSbLWFwHCRNW7fzxUS0rBa7GByGrju7/SlV0u6C91VDG0VG3P8JHz1fsDG+QnzAraP
         g6enlDi5mHnVIVcS/8Cs4bCX93yJRDO8MR1PKMMo3D+NVaqj5Wze2m6WXoL2dd3J4M8+
         ICJo34rkyMgTl8u4SMfTuBYjAp6AgmLl+BrEWglv+kElpblQbtTAEYKvUzCMvwH3JLZZ
         jSktAP6NRihwHFrxJDkgeD5Nur8x/qCwmlYIQMO30x5HrccZimu9NxdtwIdOlpPYZGwO
         kBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409150; x=1793013950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hh/Ql9nrQN77Ly3gXCUeGTtJgIJ8Ua0NJFTzN9nXRkk=;
        b=gL0gt7GeIv4/ysOG+sN7neNKrW4gent0E5ZpdtYw4aUZUtqCRLgtXL89q4ac73/P0H
         hTgD1QiuRCtwmJZpmLBgcY/PoAVOfj6Y5bZPlR3308Xz4wkvTICZRVtlA/9CoI/AyieB
         dEvHBls5NiOPayoIuSeKA/URkyKrWxl70OnTb3mjZyv4rwnPOEpwJ1TMkqqjn9xJFhXy
         MCccslvx/eysqJ2VhqvRgSwfbVhJA+O5DnhChY2dgnaYThr9mMvhXo7YOYX8ASttsF9g
         RJ4vFbdlXuymS7mqQpVehitT0XIfz4QciPVZgNgCaRi06n+NbUETng8lWkhXI9a2sH5c
         wl6w==
X-Forwarded-Encrypted: i=1; AKwUvBzG3gaN7Km8Ae0P5pbfDFsP2RVth7OXGO2/QSbq12BH395b4OKrt0K8WEkp/3YU6Em2mA8=@lists.linux.dev
X-Gm-Message-State: AFq9FYLZBDpmL5eEf9p6RLhDNHM04Rifm/EHmrLvQbt2vmWPT0tUCahK
	fIOCI8Wqr0qOW1DHZcIPBGfnBwS6aY/vD67vOSAnGfYo6m7gNLleY861/JCdazCWRmlLnUs9LON
	i4luWtIjJ00pW45QNQKo9BNaXuDMNKWU3Nbwt1KOnZOUp0rdrb/l9w5o=
X-Gm-Gg: AYBFou0p56tcF3WQz85Ck4BumoY13MG8C8u3I0eMwpJlr9bVZ9hSnK8cQ/cb+SRtWVL
	WRk554khfJgT5PHQl7Y7lGZq9n5XiKAdRqFNPhJsCaYy2rWmfgyuJj+iI4uQMt5ghX1iRNEQ42b
	vtcZxx3oXR0JG9dz5oxq0cvqLyrBVQwlAFdM6CW0nccW1y9vmM+7UZyQshjKPDT3uGW/wnBvBdE
	Anop+q5tTgmy1nIjolUMvrCK/YBwKq6CfNDUBF+i4zxdja80hwZtNiDnrzSwpRw2TzLEKaGCFYZ
	5CS/VWH1+l1/Dt1KOU8SVse077yAJdPIam8nAyUJm7OSKGlXvBxc0K6dczsPnYG6snXogdMokJp
	wsfXbSkj+0leVhpYft/TkJITpxslqRIcci/eYw0Oe3e6n5xyhjnWgztxsRnXhADuccIxyOb55RK
	0yZ5t4wbwvStwZ
X-Received: by 2002:a05:620a:4491:b0:93e:c12c:9b6f with SMTP id af79cd13be357-93f29df45admr1138173785a.74.1792409150123;
        Mon, 19 Oct 2026 04:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:93e:c12c:9b6f with SMTP id af79cd13be357-93f29df45admr1138169785a.74.1792409149575;
        Mon, 19 Oct 2026 04:25:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/8] arm64: qcom: enable display card support on SM8150
 HDK
Date: Mon, 19 Oct 2026 14:25:36 +0300
Message-Id: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADH+1WoC/22QzW7DIBCEX8Xi3E0Bg/9OfY8qBwzrmMY/MWA3U
 eR3L3YstYdeVhppZr/ZfRKPzqInVfIkDhfr7ThEwd8Sols1XBCsiZpwyjNGmQDfF0xSMNbfOvU
 ArZwBFCmirGmhM0Zi8uawsfd96+f5pf1cf6EO26rD4XCaIy68bL+0CI8syjgHb/pCSGjNFUqRZ
 TKlWvAsrxZJ/vY7EiUtYNJjD98dGqiVvnb20gZoTClzQXmeyrRaxBatlUeI1t6GKhnwHt575QM
 6srVtrQ+je+wvWdhe7rhe/nv9woCC1EyUvNDY8PJj9P40zarbCKc4yHld1x9u1ZpNawEAAA==
X-Change-ID: 20261014-sm8150-display-card-e43ee5b08c61
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
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3221;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CWiZ+B+DX/pd1HPJMvcRWesjFuvAJAW1/O0irKFh9LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f41nujOmG9xiGIKJ+PgNl51GSg+JoyTA/w+f
 XjJIrGXAPqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+NQAKCRCLPIo+Aiko
 1X0GB/wMLPvcOXTm6FpGqFWZgP7eVl8YyL4SXJ91YuKHs5pg7khYCEdIVqnHABKMcgBz7rJLFlB
 bhDjTi994W4x6GeHbBUKgRn0v/Ar4k557nm9SFA1vqal946Mb9dBh3/yXI9dQkksjs9v7mpqyBP
 OgJos7Hpbi464D/hudXq2k2rCZgivYn0vhmGcS+64IPuapB+C5FiGQeERxOg3kUqDEDfVoVcslt
 foHItInltSlxqTza4GfRuTXRdt727tbQLA2WCeTG8ALZYdMy+3/apHYpfkHvfhJmGb2MTV1tvlo
 9MaD8rESWCZ0YR+EnWg9xY57C5PPzj6c6rux1U5WXYxqu7Gh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXxEMT2ZQ2a1tH
 mNXhI979PlXo1PV1r4ihoOxGLV1Na5558O9Kr3H8MnOYj2yXM9QSOe6qiJMUR7Kgn1aINqCNFXM
 72BCsRoa/dHwCVwXWFmd16zLvke+3H0=
X-Proofpoint-ORIG-GUID: AINIvbSIiaj-qOxb9UIJQlrHee32FWyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXywgXqH1++Tfw
 oZ7xGkpYc3wyPIRq90gWd+txnG0RZEjh0RwVWM+UlDG2B+u6elMrAwPgXVuI7yI2FeHL07tovGd
 6dUUHV5/qOIHGq72FHhAO6lGHh8/MUJhcPjG/MjWAwkvDP8gqWHe4K43fFgeQgttBUIybvksMHF
 xgckEiGW6NX9twJzvjSDb/BWZjy2HESP+lalz2WtCKU36hFL6MYvLXqFMR+T4hmCFl5pxWAeGSY
 t06lYXL5A89RbxTAMRJv9wc/ui85zuKA/1yanURIZ4X91H43Gs40iBSJRAetQsxd0aRmtnyZyem
 aXF95LTFpydvfpyuNyUVY/SqbmEGHxK0TigRP0ErRl0xd59EvxDjmL0k1E6BKE+ZJ3k8Zltr/ZR
 Lg7O/4OqcwT4L4x6dhrYebeilM+k2T3iiGlZViRwt2POOxai8qysu4+c4ilo2rRfb1slAz5gpM/
 vNbeybMjlWnG/RWlqaQ==
X-Proofpoint-GUID: AINIvbSIiaj-qOxb9UIJQlrHee32FWyd
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5fe3f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=ObozKJ859q3l4po21PQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

The Qualcomm SM8150 HDK can be equipped with an optional display card
having the same panel as the display card for SDM845 HDK. Reuse the
driver submitted at [1] and enable display card support on this HDK.

Unlike SDM845, this also requires a new LCDB driver, providing voltage
for the panel and several fixes in the WLED driver. The FSA4480 address
fix is independent and can be applied earlier.

[1] https://lore.kernel.org/dri-devel/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped WLED patch, duplicating one of the applied patches (Konrad)
- Rework the WLED auto-calibration patch, also dropping the reviews.
- Tighten voltages in LCDB example (Konrad) and in the DTSO.
- Renamed the node to regulator@ (Krzysztof)
- In LCDB driver, fixed handling of pull-down on disable, fixed caching
  of the state, added REGULATOR_EVENT_FAIL and fixesd short-circuit
  recovery (Sashiko)
- Link to v1: https://patch.msgid.link/20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      backlight: qcom-wled: fix string detection brightness on WLED5
      regulator: dt-bindings: add Qualcomm LCDB regulator
      dt-bindings: mfd: qcom,spmi-pmic: add LCDB
      regulator: add Qualcomm LCDB driver
      arm64: dts: qcom: pm8150l: add LCDB regulators
      arm64: dts: qcom: sm8150: add MDSS reset
      arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
      arm64: dts: qcom: sm8150-hdk: add display card overlay

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/regulator/qcom,pm8150l-lcdb.yaml      |  81 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |  14 +
 .../boot/dts/qcom/sm8150-hdk-display-card.dtso     | 113 +++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |   4 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   1 +
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-lcdb-regulator.c            | 494 +++++++++++++++++++++
 drivers/video/backlight/qcom-wled.c                |  56 +--
 11 files changed, 746 insertions(+), 34 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261014-sm8150-display-card-e43ee5b08c61
prerequisite-change-id: 20260122-sdm845-hdk-9466530c4267:v5
prerequisite-patch-id: cb272273cdb260eb5049ba5cfffe13e7904e7a70
prerequisite-patch-id: de7bcd02cfa3baa997e973220d71791b4e74b4cf
prerequisite-patch-id: efe1cd41bd8c1ddf7c9491a6fca5aec877afce3d
prerequisite-patch-id: 98360ae85418d09598608b3a6337aabd76eff717
prerequisite-patch-id: e46e47c4d158362a382efc455438ef1fd5c95f42
prerequisite-change-id: 20260908-qcom-wled-backlight-fd9574027353:v4
prerequisite-patch-id: ad71f17b07fe258da495c7df319d77c63ab9db7a
prerequisite-patch-id: 0403e028ec3ecac35344dbd6dfa430abb71d45f5
prerequisite-patch-id: 2294f3f59a928fb80b92ff9f1ea57d7eb47365cd
prerequisite-patch-id: 74b7c8ba3cc2e3d9475f4f219a8e8d10fc381d44

Best regards,
--  
With best wishes
Dmitry

