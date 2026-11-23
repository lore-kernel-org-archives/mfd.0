Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467310;
	b=1h9eerCroaVejMWsrNCV6PdNnuZV2xu5ZGNL2PvMj7B6wBVT4bhm+sB0owpl7ShpC+AC
	 rd38c8zaNHbGwtaX6GKXJuIk3m0SO1Y5X/uzaNMuea7YLMsPNMbzvfrmdV5xI63A6lcPV
	 SxJbRnTcF2ESo4G4YbJ5eiqXT5QyPQFJqotuZxVHNMWe9nnMvJ28EIx7B6fnxCfuX9MHQ
	 mTnMHtgwyvfkDGol2cXs3HtS+MMY9mTJMHuma8/wcAbPzMCe6hcYFjbl893MPcU9XLfVc
	 ApbfNMuBcLPEWlv6YB8xpfmw3T2YOyF7FMZpmnEdyB8Hjk0quBoKfZb5FLQG5V3LNeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m4Gg0S5k6435INA1ZtBPlYq70/Y86dn1eAS2yd6Cy3c=;
	b=kNtn4n5i5eIfGSLUtNrVvsW7UaMz22zgZzoGgVJbRSysUMeTjjZVOn/+LHUy4+odg2qd
	 u2dNTZtk2UwMUQbTrM2L+EvPxMgMuNYqCpd94J44bpIPeHUZEfg66yX2WPoffMzae/qdr
	 rBUAHQpigV0i8Shdd6jOWt8NS5y5zQH/tYJm0mSUTZUzo3m3lOAUVP+jQXLgjUB01oSxA
	 Jde+rcrE2RSm3HxgMq0gmjr8nX9dSshbrd61CD6DX588YOZjR19Ir/gHwNywNH/yIkdZ8
	 Mb2idi+cZ7lP4zAi99P/qqlIZIYNCLKXkQcetNOEcbds/VeVVFjwuB9LEOXee+xRafQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hwmXy8/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3GR2u6f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE3606A331
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9AE3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwmXy8/w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3GR2u6f
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJulcR3963226
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m4Gg0S5k6435INA1ZtBPlY
	q70/Y86dn1eAS2yd6Cy3c=; b=hwmXy8/wPTp5CxnVneTEj6McBvUmtL2HplTUmQ
	KOSDj8eW2Z+pdtKSj0XDQX9qSwXwkDwnAD+xXZmtqiRnEQF6h2/QGjLrfhsP6BFK
	bsQ4Ii4KG6pzIx6yICi0DDWj5wOM/L0aPmpPyQ2c1RcfkfUFlJPfdzyKm6MGP/Y2
	4l2ZnsZsqudO47Q2qZPW5X2tMrQxgoLsBdVwgOvDb2o8Yrpg6LaerbFWDVWzVEs1
	kJf6pHLNqIa1SMqD0Me8MZCNuY9CHvB0nMoZWQK3INxNqmxDx5+JlQqdQIBld4B0
	O1EaFMoh4xdizyreNK+hTA/ilzGZPMoa/wtikNZZwQDRvnRw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7u30v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so3426432eec.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467307; x=1796072107; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m4Gg0S5k6435INA1ZtBPlYq70/Y86dn1eAS2yd6Cy3c=;
        b=T3GR2u6fde3S61IN6TSlOG2+Jo3psBzvt4Ad5hNeNDVp+Bmp41xG8FbQMvSSvzebCh
         CB/7g602mkAIOHlDtFWFW9NWQkSOgNER2sNvJJAdN4rOJqSpdn2KMv5pASdn9PD8BHYQ
         SfAak4bAR3SFQUVaVN+/Hu+dRF+fhBffoULX3Lc2v2+BcA/qIkYN/IqpRdh+2EJZw406
         3jxNlaS76tQZfb2jWsVT6lL9luDAxfNkG3LzHmRvaPYiIGsusZ361tvP6Fq7PRgypUKh
         a3KvFeL20q2pBmNxK0b6HmxvLsMgENS59vKUZm3qio1mAyPwxuH2QOh1BmbWc6UzQVVo
         Dh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467307; x=1796072107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m4Gg0S5k6435INA1ZtBPlYq70/Y86dn1eAS2yd6Cy3c=;
        b=M101OresLHXKHppoqPviVsujBI77uCM/kRy3cG77ZdFLhKk47Js4DNskV1lNXvLuAr
         2lUOjLoERGnHWO/DLMLgN+ytEbop0UjVBOff6CfYicwhXjYqmTnzw5mWKGawhqeTCSQi
         X2FZfh+Pi3K/+nO8MwQrUPRAoJabCf5qSntgzWCpqQx64o4vw3s507+ZOlYlF8qN09Ct
         DZUADTRD2WavLLhHtVtowez137v56R0ZL/3ZF4JDQUlEHHUa3O539j4e1Fd8kEQTQoc3
         qhrxvCaHTx9TjoWCWeMIx+NBdRSKsJ8+07RchocTVygrwpgkrEPn7rmtR1d1nYDlxqY/
         +qBg==
X-Forwarded-Encrypted: i=1; AL+hErEo3MKNkYh8fIpcYcCH3Ytf5ok1R1CSoRhSFpQhTO+tPDui/Dj/U/QKjt9QeurIkO5AoF0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+utugiVq2npMDZHsq9os/8YpfQs7RBtniXA/H/9xNjgQopviCS
	jeBPEAki6olD+I89tfK0Jpu0OMaAkrqA5/d2o/PDg8eXyhWNsC+s8KEEtHYcdKmT6KkcsTTUo81
	EULAKdQBjNWTIT/0HUKsQvQdr/f5rCI+Jue72c7ltJOIzyBhYw3jpUz8=
X-Gm-Gg: AZFdTZcdLyXxW8ZJ5Qcl2zze5XguN7h7C3SRogVVMExxNcO4+fL8V5ZzBN52gupvEnq
	BPr4/Hk/GOYxJ1hsVFlp0HOPla2bXW7K9DsNotimJyXu2NKU8tSFlHzqClm9N9kN4ihX5M1OChA
	iLyG178GtDmLEj81hix2wFSAtdMSR0AZrphvlL9w+zuBQyPw3cTPNvYqenSf4bt9v3fcSWWDVH5
	8rgnqb/nr8RdRAUcpRrHFUMT/CRO0qx81iBmRiL1k82LAPLxR43bW2b2ixIVbF6+IE5vLy5whSU
	PBfZFKaqdXummnOKlHP8xfktIRtepvtU2y1BayUeW3yTcJy7WLCymBUVy2clHhtIsEvB9O+nuHO
	pM0hS61lE4MrX9wCVrbMnrJYiSv5IWg8JQiD0+l331NRAu3OTDXE1f9AY2+y3NhL3X6zLI8hOTB
	TlTNLr/4Q/
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr18417434eec.16.1795467306579;
        Mon, 23 Nov 2026 12:55:06 -0800 (PST)
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr18417375eec.16.1795467305833;
        Mon, 23 Nov 2026 12:55:05 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:05 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v5 00/12] hwmon: Add Qualcomm SPMI BCL driver
Date: Tue, 24 Nov 2026 02:24:40 +0530
Message-Id: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABCoBGsC/3XPwW7DIAwG4FepOJfKOBBgp73HtANQ0yA1YQ1bt
 qnKu5fk0ErLerH0W78/yVdWaExU2MvuykaaUkl5qEHtdyx0bjgRT8eaGQK2QgjJLyH33Icz777
 7PPCjCdZCJLAoWT36GCmmnxV8e6+5S+Uzj7+rP4llu1KA0P6lJsGBay+xjeC1duI1l3K4fLlz7
 fWHOtgiTvhQNOJGwapE8oQGFAntnyjNQ7FoN0qzKCo4AGNsiPqJIu+KAFAbRVZFgbfOBN3Up/5
 R5nm+ARgqmruFAQAA
X-Change-ID: 20261114-qcom-bcl-hwmon-d8c990fe0924
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=7797;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=amOVXlt0YgK5m/43XjRUS8Xc2xOI+q2KY954dScqRz0=;
 b=Imkgrw9lFccnrFBrzh1D6sSYSh0t3MbbpQ+u72dSeOnIDbFpQbei+BJAAuy+4eRuBeLM3J5VF
 v8ybA+m78A9B9MdL151875/hFZ0JFCH8xzNUYe8XHSJI5g/3QGAIuNt
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04a82b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8 a=jZPNHtCe3420C_rECVwA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX2HXDUOPHSJMz
 DUbqnGpjcVbx8mWZZKOfqqxi6VuXXHlc8gkWj0edS0FvYFB/jqf/x24RdF+2Ha5IGwhxLPvZzFk
 N2ePGWWm/OMnSphvHccftHkhzcOtrGO2TVVRfOaTW1Ynfo4K0Az49kJ56fcDyGEYoNggDHcxSw8
 ol0DdGvzQI0SUPwQNx/ex9XMbn2bL0mF2KurhzxMuqBtJrA5cO/bRqgrz1kjR/k7NLRV3/A4Q1+
 x8/eXpX/LczJezSQ1+khZeXaiaE70kcy3XITuwx/SVERVMaWI7m7RnbG30UFL7noLLgzaQbXFmM
 bKRI5hnlgdEGnGAJiQAIP9d3lPXsOEOpzygtnKtG481gu9f+Zt0lzbuuS7MoLJRS1oGeacoSBtp
 7ag9RszsJI/jMkuQDz7LhUXfgECOPWlpZ45lcLcFaguetH4y99ZAuyTnH7wsNDe8oofRgg9uU15
 uDpOOiD1omnCyv6N2DA==
X-Proofpoint-GUID: 9sTWvS9jwUHK2DjUCqEUSHMVUU0DeY-P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX0ggmA+uVKWsg
 YIUFSiPGCTGUdU6HyxUEUZlXquA47QFrbW6YgJvYF40CyH2iTl12kEijtx4rxZRDLx3wGuRd0pz
 NyCAtmJ56/eAbh1NY/v677mRLqgAWVE=
X-Proofpoint-ORIG-GUID: 9sTWvS9jwUHK2DjUCqEUSHMVUU0DeY-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

This series introduces support for the Qualcomm SPMI PMIC Battery Current
Limiting (BCL) hardware monitor present in various Qualcomm PMICs.

The BCL hardware ensures robust battery protection by monitoring battery
conditions in real time and triggering interrupts when predefined
thresholds are crossed. These alerts allow the system to respond
proactively, preventing battery degradation and preserving system
reliability under adverse power conditions.

The driver integrates with the standard hwmon subsystem, exposing battery
measurements and configurable alarm thresholds. This design enables
seamless integration with existing system monitoring tools and thermal
management frameworks.

Key features:
- Battery/system under voltage and over current monitoring support
- Real-time voltage and current readings support
- Configurable threshold-based alarms (warning, critical and emergency)
- Interrupt-driven notifications for threshold violations
- Automatic threshold management with polling-based recovery
- Hardware-specific scaling factors and threshold representations

Voltage and current monitoring can be independently enabled/disabled
by firmware, and the driver automatically detects the enabled features
at probe time.

Dependencies:
- This series depends on the following patch, which is currently present
in linux-next but is not yet in the mainline tree:
https://lore.kernel.org/all/20260813211433.879638-1-linux@roeck-us.net/

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v5:
- Fixed a use-after-free on driver unbind: consolidated two separate
  devm cleanup actions into one bcl_alarm_cleanup_action.(Sashiko)
- Fixed a missed-edge race in bcl_alarm_enable_poll(): after enable_irq(),
  the alarm status is now re-read before notifying. (Sashiko)
- Fixed a missed-edge race in bcl_alarm_enable_poll()
- Widened the threshold scaling-factor math from u32 to u64 with a WARN_ON
  guard against a zero scaling factor. (Sashiko)
- Deduplicated bcl_in_thresh_write()/bcl_curr_thresh_write() and the
  matching read helpers into single function.(Konrad)
- Replaced the three separate in_mon_enabled/in_input_enabled/curr_mon_enabled
  bools with a single features bitmask. (Daniel)
- Merged the separate IRQ-name/hwmon-attr lookup tables into one bcl_lvl_info[]
  struct table. (Daniel)
- Removed the now-unused bcl_get_version_major()/bcl_get_version_minor() helpers.(Konrad)
- Dropped the qcom,pm7550-bcl entry from the of_device_id match table. (Konrad)
- Widened bcl_device.base from u16 to u32.
- Dt-binding: Reworked the compatible property so qcom,pm7550-bcl requires
  a qcom,pm8550-bcl fallback compatible.(Konrad)
- Added hwmon sysfs ABI doc for the driver, including the full compatible-string
  list and sysfs attribute table.
- Link to v4: https://lore.kernel.org/r/20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com

Changes in v4:
- Dropped empty line from pm8350c devicetree change (Abel Vesa)
- Fixed use-after-free in delayed work in tear down path (Sashiko)
- Updated DIV_S64_ROUND_CLOSEST instead of the biased add-500000-then-truncate pattern (Sashiko)
- Updated regmap_bulk_read() for the 16-bit LSB/MSB pair (Sashiko)
- Removed dead code after above fixes
- Link to v3: https://lore.kernel.org/r/20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com

Changes in v3:
- Rebased series and added 3rd alarm (emergency limit alarm) support for all PMICs
- Used static hwmon info building instead of dynamic info (Guenter)
- Removed unnecessary generic labels sysfs (Guenter)
- Renamed struct bcl_channel_cfg fields with _mu suffix for clarity
- Removed linux/mod_devicetable.h include (Uwe)
- Fixed uninitialized cache timestamps (sashiko ai)
- Fixed Integer truncation in threshold writes(sashiko ai)
- Fixed Missing data_field_bits_size in pmh0101_data (sashiko ai)
- Fixed DIV_ROUND_CLOSEST 32-bit architecture issue (sashiko ai)
- Fixed CHANNEL_CURR max_mu values using correct formula
- Fixed critical teardown race conditions
- Added device tree nodes for PM7550 and PM7550BA on Eliza platform
- Link to v2: https://lore.kernel.org/r/20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com

Changes in v2:
- Reworked the binding from the generic qcom,bcl-hwmon.yaml schema to a
  PMIC-specific qcom,pm7250b-bcl.yaml schema using exact compatible strings.(Krzysztof)
- Dropped the DT-configured overcurrent-thresholds-milliamp property.(Konrad)
- Renamed interrupt names from "bcl-max-min"/"bcl-critical" to
  "max-min"/"critical".(Krzysztof)
- Limited the binding and driver match table to the supported PMICs:
  PM7250B, PM8350C, PM8550, PMH0101, PMIH0108, SMB2360 and SMB2370.(Daniel)
- Folded qcom-bcl-hwmon.h into qcom-bcl-hwmon.c and removed the
  macro-generated alarm mapping helpers.(Krzysztof/Bjorn/Daniel)
- Reworked the driver around per-PMIC register descriptors instead of
  generic BCL generation/mode descriptors.(Krzysztof/Bjorn)
- Added support for 16-bit voltage/current input registers and
  SMB2360/SMB2370 2S/3S battery configuration based scaling.
- Build hwmon channel information dynamically from hardware enable state
  instead of registering static voltage/current channel sets.(Daniel)
- Improved alarm IRQ handling with per-alarm locking, wake state tracking,
  shutdown guards, and explicit delayed-work cleanup.
- Switched probe/error paths to dev_err_probe() and tightened BCL enable,
  regmap-field, and hwmon registration handling.
- Link to v1: https://lore.kernel.org/r/20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (12):
      dt-bindings: hwmon: Describe Qualcomm BCL hardware
      hwmon: Add Qualcomm PMIC BCL driver
      arm64: dts: qcom: hamoa-pmic: Enable BCL sensor node
      arm64: dts: qcom: pm7250b: Enable BCL sensor node
      arm64: dts: qcom: pm7550-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm7550ba-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm8350c: Enable BCL sensor node
      arm64: dts: qcom: pm8550: Enable BCL sensor node
      arm64: dts: qcom: pmh0101: Enable BCL sensor node
      arm64: dts: qcom: pmih0108-kaanapali: Enable BCL sensor node
      arm64: dts: qcom: pmih0108: Enable BCL sensor node
      arm64: dts: qcom: smb2370: Enable BCL sensor node

 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           |   72 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/qcom-bcl-hwmon.rst             |   67 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |   22 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   11 +
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi       |   11 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |   11 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   11 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   11 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |   11 +
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 1434 ++++++++++++++++++++
 18 files changed, 1721 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcom-bcl-hwmon-d8c990fe0924

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

