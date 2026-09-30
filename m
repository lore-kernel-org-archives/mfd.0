Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD414C6F1B
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772382; cv=none; b=OxkM/LYowGRGe6ALKaxoLLG4jsUBrmB8O52eesg/ix5RfV4OUpgIHhEY2uSXAEgA9jQaMKqlq+P+FGVyj6/29UVI1wkcMjOioqPjmk/URGb/aXOsPea89moAaomJEiZdWwrXNGrIhUcBUYebq5xRVXdvU9wxlgeZx68+LNB6pjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772382; c=relaxed/simple;
	bh=aTL4lw39PtnnQyOMulEmRhSSF0Yf6RJS/a2j4gCoSSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iwUqa7JVav0+vNADilEcV0L/f15uB0mZLRQOD8969skWWUsxaFA7ZIzlLSA/jr//YFpnxHLhnAehB86RnkhGgHMIOq487FAfgouUhpK20sFTZpNM0hN58tcEQxHm2a9bPahUE4LR8TwXnq7BYtQ7T+fbO1O2OYfVxeHzXzgCP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljaE3gmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx82dkeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljaE3gmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx82dkeX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8LhS2898217
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fidXHPHvwOp5wic/6WE7FT
	nm3CRScksILO2dTzE8xLw=; b=ljaE3gmyCtsc5PlvfQ7o8AU0kGlJR7QhNpvN0B
	0TlS2HTIVtev723ZN5SgUIRuQhVwc3RXscPUg8XCazhwBHt6Bt6iolh3gbhqzL0c
	diPTFiSAsIiHbgBKxEI5tCxN2Ppj5Cqp6jFxSBwTI4icbvvT0RyCNSQk2uxXmHTu
	hZgUADJ3ecjlQFFvIP8+huzbSweLiQWWQAMA7CdQgEzi0JJeg6jnvHNefHvBpc6g
	L6XdceIgSlGUSYp2TE2ZV3GZPOWo/tYIf9m4SkPAYca6WI28jHhQXihltFPX//1s
	Y2R/NWdcpT9H6jTykGEWGrkTfQ1Y/lLIQlyY/NLHiDzObIkg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn298d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf257e7b5eso136735137.2
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772378; x=1791377178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fidXHPHvwOp5wic/6WE7FTnm3CRScksILO2dTzE8xLw=;
        b=Gx82dkeXSLtcZjEzN5utYaFbSxsVUjASVn3HSx5sAr0USaeom+NLZHCCpoj6eHSZS5
         MiSsHQn5vFLtdVDF7giWuj+bhnBLD/OfzMHOTnozwcb7S1bXzIJsw+jMsg98/2hKCDpS
         YSAJlHqWDVUAXfUM28QmqTuRsg6Y7PEjkNvuETq8PyBGEbwKJ45OVO10NEdxhRBJF4B6
         tqbgERuW1ZNMnvkXKSg+VmaiO/G9pLu2QvuKUCvDfvEgNma5ngk+gYXS09W+lzDFjpjP
         SL624TdknGOjD7Rhjqjy4E0D51UJZC5jrGNMKSImG+k5xIG2oN+xRvmnhDjlMmJtWzZN
         rTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772378; x=1791377178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fidXHPHvwOp5wic/6WE7FTnm3CRScksILO2dTzE8xLw=;
        b=Ay8vDzSNaWSQB8AyVhvUsjLXKR2w5zJxxpi/HRjUR64RvfwqaWkcxBPIFtae4aZDzH
         q088+8+AphcipwGGnSyG0NfyTDGg3v9Kmb4nBNmkCiJ8woNAW2rV4ya0jT01ORVDHmjd
         AWCJUrJ5j3QZRIE0x92tSBhf61uct+9iajDN7VPnXJdXAHpEaCq/AK2pZ9K0Tw/Le3zY
         CEa2SpX+ccZOvPxLNgLXSHtQ4R9m11i300/zGr0YI46Rxpn+5ZoYl9JfWs2EtLuP5Nzu
         BQfdOGL5UAX19q1lZ3/omcaunbLwsbaJp872hYngS3hqXmK6rBHbl4mjQZ9jeSgFaxP9
         NVnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3dMFrPfh5HIm1PLPejdD6NK1m3+Q0P/XQYMsFmWS3zmObpnw7Vflte2FQjoa61aQaHvI=@lists.linux.dev
X-Gm-Message-State: AFq9FYLSt3pjnlAyjohKzZ+CTGoeZkTgVskQ2IXsiavA7ksQaeDNvdBu
	Jd4FZ9fhgDwiyNTNwx4ibq9sOBVyQhExquJHUzl52gFSrwqqr35vf2FSAfO85avuLCi/QfldCDF
	2kT02oYRW2vuBPmfplFZbKUSpnvgg7zKaUPnPcGfkL9/wCfsNR+G26Fw=
X-Gm-Gg: AYBFou0a1X/eamxvpzlZf295ISF+ju51/pKZxqtJ8AUZn4kgInRPqYjo4TKrqimBnwf
	KMkulnyCsVGwPcvM+3+TJ06aOQeG37z9BZDCPwXK+WmAN5Qgh1i7UG7+Ow8Q3IUTGMH4hXmS/dP
	jLvl0Dp1tiRiU3VIPYsjdDSnAI7j9FTTJfxeRse8vUzIXxdCSfIII17aASK0zm1cwPG8ho9Qg8i
	blgCU0FknjGcIj9dxnxWFEiFL2KMz+KEyYM1MqhRs/YXBdHIZW7jWt64cHsR5iaaf89NDw/Q7x/
	SpgMT6zk+wkKegcG/dPidHZWMOL/MXfVRqlK1yla3LsSlA0a+UsN/QuRPSLkN8kvxkApFP96Ll9
	ta7Udhh025ovC
X-Received: by 2002:a05:6102:38cd:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7be7457f41dmr297917137.32.1790772377995;
        Wed, 30 Sep 2026 05:46:17 -0700 (PDT)
X-Received: by 2002:a05:6102:38cd:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7be7457f41dmr297889137.32.1790772377494;
        Wed, 30 Sep 2026 05:46:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: arduino-imola: add support for sound
Date: Wed, 30 Sep 2026 13:46:02 +0100
Message-ID: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd049b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=QeQcAra5hdC8VfecJqYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: FKaXOzQ9pe_cUglu5t_hyBPqLTFIe571
X-Proofpoint-GUID: FKaXOzQ9pe_cUglu5t_hyBPqLTFIe571
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX4mdaHGGM7kto
 URMbvV2ZJ2J78l5LpOmTlabN3MyvgGaa/acXeqTbmIKIurKCBjbnjIyvYIHotRcy9D24LchrNne
 PQ9DTIIN8cPCpbfkNxTzzR7TjGM0Z6l4ohuPkEaynDRDmY+D/E4t1h99bqQnd1FvHyotKrESa0/
 MshWq27TCamCJdGTi9BbA5nphU/YNvOjVXpA3leLr3mS8zBC/81HAp4ibO4/LD10227pqzjxJM5
 9BUKa2/K7avKZiZb+g8xyWqPkbzNMZVCZ7gdCQegRkD/RErwhnfSxmqCEh9Z6jd25Oy1DYNMh2u
 EnxI0eQ2MyLZoh+zzWXP6O2DtN2/l7ApnT+OvMkgotuCkkEiErQ9wwWRv6gkOJNvoo/RRZKvRC1
 S9cC7tbYn/OYsHnE7WqKm5bcgTuKQubFxW6KyTAhIFxU57CE8+QxgBD072tTV2QxHrafsonhHlh
 SYlRJs8CbkvHD3TK9Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXyHxGm1lMrVzz
 Npmaz2uYWGmaP6nxeFwuTfqmU9lpHWebXLylO70NHNZZ/iAkEe74Adpnyrt2VEnoUtY8HZClShs
 Wzb6pLTMknz6VUFABpjLryKt/9FAk/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

This patchset adds support for audio on Arduino-Imola platform which is
based on Agatti SoC. Some of Alexey's patches are reworked and sent
here as per previous review comments, mainly on the dt-bindings part.

Base SoC-level dtsi bits are picked up from
https://git.codelinaro.org/alexey.klimov/linux_next_tracking/-/commits/rb1_audio_wip_v3?ref_type=HEADS

Along with these changes, add sound nodes for Imola and a defconfig
change.

thanks,
Srini

Changes since v3:
    - rebased on next-20260929.
    - dropped "clk: qcom: fix SM6115 lpasscc register offset" — now
      upstream (689364ac19e4).
    - dt-bindings/mfd: rework the audio-codec pattern to use oneOf
      with the pm4125-codec and pm8916-wcd-analog-codec $refs,
    - dt-bindings/mfd: fix "pm4124" typo in subject; the compatible
      is qcom,pm4125-codec.
    - agatti.dtsi: fix lpasscc node unit-address to match reg
      (@a7ec000 -> @a7e0000) after the driver register-offset fix.
    - arduino-imola sound dts: mention "Ear Out" in commit log, per
      Alexey.
    - arduino-imola sound dts: carry Reviewed-by from Alexey.

Changes since v2:
    - dt-bindings/mfd: switch to properties.compatible.contains.enum
      with required: compatible, per Rob.
    - agatti.dtsi: collapse each <&q6afecc ...> clock cell onto a
      single line, per Dmitry.
    - keep qcom,sm6115-lpassaudiocc / qcom,sm6115-lpasscc compatibles;
      Konrad Acked staying with the established practice.
    - defconfig: carry Reviewed-by from Dmitry.
    - rebase on next-20260917.

Changes since v1:
    - updated various register ranges as per documentation.
    - added a fix for sm6115 lpasscc driver.
    - updated commit log
    - fixed various style issues in dt nodes.

Alexey Klimov (1):
  arm64: dts: qcom: agatti: add LPASS devices

Srinivas Kandagatla (3):
  dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec
  arm64: dts: arduino-imola: add support for sound
  arm64: defconfig: Enable pm4125 audio codec driver

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 157 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 +++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 5 files changed, 302 insertions(+), 1 deletion(-)


base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
-- 
2.53.0

