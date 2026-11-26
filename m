Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690833;
	b=5j01ISpZYyF+lV+ppzXtVNjU1e2d7S6VQ4jNdedyhrlRA2lS/chLuQP9cebWotA6Tvjh
	 /2+T0gUgm1bXYp+PAoZOd5B35QJo2ZDRqOTIqLUCmvOnxxbQnjQ1BdNQZ1NsCLAPFwGJq
	 fp51XCAgSJbq7JZFueTXKZ14BArQD114nQTpFvWyDg+2oVksP17s2mod6XHXaXqM5iAOS
	 M0VGOzUdOdHTrxJ0bnYA/zm3pupQgmhR407TCJcxrPTm4+LPYu0iD0uLJc44A13xFMMjo
	 YVq4zppii1q1MHfDameHNpxhBqjlTT/wpN4iluvxRoJNeNdMcEHOclLK/EYyO844F2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
	b=262qpR4yShmwCAJgv/zAFDe753nNv44BJrb9EW88R4gSo8srvm4Ju1wgvSFQMJgPIM4Y
	 xOPUp9nWpRxIobMdapamU660Wr6Kej9DZfckQvyKBbD/+7OZsHWRhS2BR2SKvP21W/5ix
	 475sCSCkTTzjrH5EPVyIy/bY17rXuVg7EwIuw3bNxHZ3FJ6LNF9ZWVgDO6VuG+cuMXMNf
	 OqyUQNM4hcFR7Y6IoAv6P9rl95GG2cYF/Rj6ceT8BiNJahFmaFBcgjaEn3E+g/iAzyTvd
	 95H2PEI4DB6LIVvLfvY224FKng/S1NQDqt8+asUmbpKss42WjsDiIP/5eeRGvpZVOBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b3/RGVBq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgEQ52er;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23187606A33E
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 11:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23187606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3/RGVBq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgEQ52er
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXaxH4002069
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 11:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l5SIfcklw084WTI/zcukrT
	5r8aWMbpdgCAh8jjCi+mA=; b=b3/RGVBqmwgkxG15ypLBBHxy1hidEDyQoxKEUo
	62hFlQbhy8mk9SXv5I6vuOOCIEuX20A5Bob4HUvh6xBOF18t3NzKGADXASfRwBxy
	wabRNUMOEyBXZunrm9TpDy4HzueBVx2Qx5SE7O2rWupQAVJhp2V0rqSL5c2Nx/yP
	F8rv4n6gfnekZEQqy9yXML5nwbQTJFr+uxMm4Qh6U/f4c8XBGXVAaP5iSptdHZHd
	0CTiyompt23prSSR3wMamgtIKGFcCJJtXkWhqa2vYlC46CzRsEk91AOk5Cqj1kZq
	B1C8T9PnAiZAM3LJlKX1rsDuLyOHz8OVFvjvJcY41QTF7BOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaumd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 11:00:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f022026e60so74629745ad.0
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 03:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690829; x=1796295629; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=EgEQ52erAIaWYTL2c1dBu5prEWfDd2Wmeve4Pz9LJtDhEjXojKgV8GsPQ+Q3luBq/J
         CX1qp0B0Q9fnE7VgrGlvo9SJa6zhGzM6rkSoFHCyXLZ0FbTY5WQrA/GZQ+5CXByrumF7
         7wgjpV0JcLhvEzNpgmw+Jg5fORjuDTEfnnptJMdllymXGMzBWqicnQkQfUrspRCbMKe7
         mPBQVIHteOuSFv6Y4SkfxqloggWDSrXxRap5ksZkN/F2L58WBh18b1tkvgF+L4cx73sw
         EYEpf7cNDBPzeznCbzwfH3GHPHeS3fMOhhT9gcKFj/LOwCWFHKdzqTyUsM5Kn5MXLFud
         pi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690829; x=1796295629;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=w4HG5hVzpZA3ibmlnoqJffzwCr0bfRZ8qSS44rYTCYzYF/aefME/RdTbAB8a4qloQ+
         AoJ3ApjO2vXdhkPaMnrXaHcVrkj4rXxrX0bX/X3t8bFjw+Wrc6JlaZRUqhEGlUJV/3HZ
         ArJ/jqjD8ZjEytuYn/uvjMu5iWcpDaR8pit4KUgvQE6+/k5SfD8L3gUMTZiuwBBJG7Qt
         /91TinVdrUtryejl7+eqP/Ypx8Mj+vWRkUHJAqR4DGOzYUI7/NeA8FrbMGPGQ9whKqrQ
         7BNGWI8ZiqODn7pJixPtQt8TENFutRI2IpjVvymYRg5M6cXhRzJ8EssUhbEICF36qWvN
         4oTQ==
X-Forwarded-Encrypted: i=1; AL+hErEoLnEI0c8DoacagCT8rm39Rq+iXqpciAItGRlvotzauXINMsmJ2Llun9sjIfyUpehM7LU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+zFfSPKO/0nZVjzCAssGHDcwUBocrh1m5B2fxNr38P73wssTy7
	RLahuoP5Ql1OEubd90OY4o8/ZEHM+IrBKBTH+G3GId9+r42IIG2GCUwtp5Gm4UzNXPOoHRkn+k7
	oWywSnks1EEEjyxW+ROEZZzGNee/CShA8rb/nUwsebPbqvI4166OCpH4=
X-Gm-Gg: AZFdTZe0R8DMR4Ck0wNBV5lRvoD5h8HMFwBFMGsEHeIdj+e9co8dBXIR/HMkVvEUY0K
	qrywI8I3+q7zGWA3hyLmOj969fzAzMEyl56DZtx5wfghLoHuU3hI2DIqYwSaPz8AeN/21tkvP2O
	JW1IE/M9b1+z0rNHB5IOf3ezDBwvPdnfFr6zVXjmkQWmCW4/8Vx+9iMxKjRB6BPQQcMZsyxSmLF
	Nga7xvEF7Nl9aWCrxLYl3cQ4R8TgWRGK1cOipebrw2DPO31lqh/xtGMAlxT55fU2ZBl3cQ86emt
	JCABw+iqVZRxGy7gqHpKQQY95H0oF9mvxEeyxnotovGDTQoM0Xin2sPByHPfnQbrGNfGrogKB+d
	t/g2nVUoPjqueUN3+oBzYIguShc+3gy1KkvmBm3sjupOxNvn7Byw/IZPleZ62W2u3qwwpiKQNfj
	U=
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174815005ad.28.1795690828006;
        Thu, 26 Nov 2026 03:00:28 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174814435ad.28.1795690827206;
        Thu, 26 Nov 2026 03:00:27 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm101400615ad.17.2026.11.26.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:00:26 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: supply: Add SMBLite charger support for
 PM4125
Date: Thu, 26 Nov 2026 16:30:16 +0530
Message-Id: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEARCGsC/32OywrCMBBFf6XM2shk8mpd+R/iIrGJBqzRpBZF+
 u+mde9m4M6Fc88His/RF9g1H8h+iiWmWw20aeB0sbezZ7GvGQhJY0uGlcFd4+hZbfPZZxZSZvd
 BclKsF1y31qBShFAB9+xDfK3ww/GXs38868b4e4KzpZLSMMRx13RSGJS6U8JRcMIFpZzQqiWp0
 Nu6b/rQkjWwsC6xjCm/V++Jr7BFkXOS/xQnzpARF3TqAmrkYZ9K2T6e9rpYbOuB4zzPXwUgle0
 XAQAA
X-Change-ID: 20260827-smblite-charger-for-pm4125-d3168a705520
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690821; l=3185;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=Egbbn6MpPK4SfNFKa+uRss7dEExa4CDRxOxDLWL7XEk=;
 b=MJlKqNEhwCiPRU2v7OBEyMqj7RJreMUdouoo6UPR8Eh/K5j7FyEhbHlS4tEBFLc5v3RN1+1+V
 0bPxMxOHkzcCeIGRFX/tuNQw4LarCCAdvCOVXP3m9mWhmPogIeNFpIE
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfXxKzK+mRL4UbK
 oRdExZjsyGPt3varYzKkZ1u7QFYE9rsbvj545piIzG1XC2DTExbdF8JDwjY0PABoL/Imj0tcpBG
 G1b0enBnk9tj8VNXHck2N9Wo4Vz8vJw=
X-Proofpoint-ORIG-GUID: wONNO0aF2YcrHOipABR8AgpgxUlV9OQ4
X-Proofpoint-GUID: wONNO0aF2YcrHOipABR8AgpgxUlV9OQ4
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b08114e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DxrESgKfosCQc-jqPugA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfXxY0S6lOdGHk8
 tvSuQ93LvThIa8XgX3XFQ/lM3uVF0bhJ9gtWp8+1n6Bk5AJvsTEjl9Y3NmyjzdRWPL9ONF7z5SL
 lQNsLq9zersbsu9x5X4IyRe7yK71rasFtvH4BuGJLtuBXjNb7gLhHibT+Up+U5EtBatqx7/o/8s
 u/tZ8YZa8imSu9TWKvpg4dr2Q3li/f7Ja25LQjQFkpTDaFzoUINl9wieDSbUoJLydPMQUSI1/kN
 aF3b4AYWg8ZISTFn78vkeQr+LtIF5579nqgGzi+cla6LpR1OZf9/NpEnDNJ1E6R4TYZTyDx3fq8
 oyldd3VJrdBgrydNviO3/2Vy5LMCyrvw1rs52ID5VPZcefVAotOVslz7CyIoAcfoDCkwOV/lumy
 SoH1FPnAocHmg7/+TQj0Iq0XkSFTtUqByB/uETf2iY61HSzRawvMrRBnVxZGcoZrCLMkQGmBcDu
 WcWKuF2/Jw6L49gZeyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
integrates the SMBLite switch-mode battery charger IP. The existing
qcom_smbx charger driver only supports the SMB2 charger IP found on
PMI8998 and PM660, so PM4125 currently has no charger support at
all.

SMBLite is a reduced-feature variant of SMB2: it shares the same
SPMI bus and overall driver model, but uses a different register base
layout (five separate SPMI peripheral bases instead of a single base
with fixed offsets), a different battery-overvoltage status
register, SOC-based recharge instead of VBAT-based recharge, and a
different JEITA configuration sequence.

This series extends the existing qcom_smbx driver to support both chip
types side by side, selecting the correct register bases and handling
logic based on chip->type. This keeps a single driver and power-supply
class device covering both SMB2 and SMBLite hardware.

This series:

- Adds the qcom,pm4125-charger devicetree binding, covering PM4125.
- Extends qcom_smbx to add SMBLite register support, JEITA
  threshold configuration, and SOC-based recharge, while preserving
  all existing SMB2 (PMI8998/PM660) behavior

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: add per-entry maximum bounds to the JEITA threshold
  arrays, and a dependency requiring both or neither to be present.
- driver: defer enabling SMBLite charging until after float voltage
  is configured, and explicitly disable charging at probe start, so
  the charger always comes up in a known disabled -> configured ->
  enabled sequence; leave charging disabled on probe failure instead of
  restoring the prior state.
- driver: propagate JEITA threshold write failures, require both
  soft and hard thresholds to be present together, and check the
  other previously-ignored SMBLite init register writes.
- driver: add watchdog-bark IRQ wake support for SMBLite.
- driver: treat missing battery info as a probe failure for SMB2,
  matching the existing monitored-battery binding requirement.
- usbin_v is required, and channel lookup errors fail probe.
- The USB-plugin handler checks the charger-status read and both
  charging-enable writes.
- Link to v1: https://lore.kernel.org/r/20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com
- It depends on charger type detection mentioned below.
- Depends-on: https://lore.kernel.org/all/20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com/

---
Raj Aryan (2):
      dt-bindings: power: supply: Add qcom,pm4125-charger
      power: supply: qcom_smbx: Add PM4125 SMBLite charger support

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    1 +
 .../bindings/power/supply/qcom,pm4125-charger.yaml |  119 +++
 drivers/power/supply/qcom_smbx.c                   | 1081 ++++++++++++++++++--
 3 files changed, 1089 insertions(+), 112 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20260827-smblite-charger-for-pm4125-d3168a705520

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

