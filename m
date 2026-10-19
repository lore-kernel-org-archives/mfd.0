Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D393FDC18
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386065; cv=none; b=Ztwul4GyUFYpLBPNkE2L34yZAQ1z5JLisapYxVGYfwW1UaDJ/RLwuArvI8Z/4vraeKo2fhnzNG4TGxlDI6Xh+LoXukZ9xXNmW0+EdFX/w1VYah2SG1PtCnLKDLAsrLB4cGsA8b0dj6sXw1MQw6zvtais+tckrS3PBsupp/nRrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386065; c=relaxed/simple;
	bh=qg0/cscURycJsdkMQrebTh46raKvBmrkckbAtyxDaII=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hfNZpug1yLu1YKQtkyTeVWANqSonmJNUBYpPStY7C4IsNMQ0Ys8cjjFR0dv5LOfVT2+g5wICOw8SSghJN3HRczsGKnMKqiIVYW/Qdrlpzcw7VvH7y+wtLJWJLt2tsgOrl6+XBAg/RFbqzFM/OhN11ThDVsP2Il7mmcvlUbP7UR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxeqxSrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aG2Mjzu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxeqxSrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aG2Mjzu8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j2cX1748985
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=; b=JxeqxSrY1RnVQSTB
	xHba8KncJxS5Qchn0yc/UDxrVpQ3MDVGS4QOkSlZemnLCS6tsJb26e5EF3ZTFhnl
	HzfX8ch/4ZtPE04TVAf6oR2e0w3Uwqvy38/YDfhVEGNmI+47k7oq2Rn9bmdigDR0
	4XmmItPMzPwdYS5l48bQcTuh1JwcWlWrWqHmK7mLrTvAovBMTWKCVzm/rjVITcp0
	PAjqxc/48O+BXGR7ZYHa0ap+akp9SoT5PRQf99vbhEXXP1xvfe2xIn4RbcN3oNvN
	hCb0wBfSHy4bkcMNW8Jr+oyAzz0TQHGzqWElFVDGfmC1Z1shtooSA9uMVMXDyUMu
	KnvRzw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183cw4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:00:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ba4757baso16675555ad.0
        for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 22:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386057; x=1792990857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=;
        b=aG2Mjzu843brdAuLTiFyZ8nwCAjVYLe8uSonNulrx9eFleA1E/gdpCq4k/LYIdbpTC
         ytK+6QC/S7wFthgyZ5hE64hJCo5B2pl15DSNsreeHuyrIyQONcL3blhLMcDaeRhQSDWT
         v2tJFohAForwjCrujpgkZd4muGDdBfCb1DBKe8UTJjFyJmKFzBt70TlslRNO04W3Aiid
         d3bVz4vEPDAGNeevTtxaGWRC+6kNVElK7F95cFAWktiqrzsManZHQmIz3cVdds4bYO2N
         uFGqUuX5kkUc3XicLT6wT1tsRUHtQSGA6trm4TnMA580m9NxaARe0G0kld8GyGBWVHrR
         KaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386057; x=1792990857;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=;
        b=Dc9yez52bnN2JEmIgA2Bx6HpcirdWaSaTroWgDRJZY03YLS7HkeK+rVd3/haqUdD1E
         IJbIickxzR2OQb2zrMxXoGXnQszqBegwXIT3sUsYpkHUmx92cClYxzS3SZUdFWlvKkG4
         Cl7P4qANz4+TfxtZ1s74mjLIi9cpiKimeXK4e1tOnVpdHfvC+v+P9Pp2B+of0AqR/jDZ
         ovsXe8iBeuinb3mRyQcEZ33QppBrmrWFHYRl2EE2QLqaG3QvmTfNWZkVeTW2weT9Z0ni
         Yt3uhwAA33osuKaeZTQToDxeVMjzbuoODlgQc6KcdxcuN9IikjlFq5ztqDc3feF2Z/tC
         +pqQ==
X-Gm-Message-State: AFq9FYJ+g8vz79CT6M4XLL+M1TbqN7whbZhRW2EtoeeMHcznyyF4h/Sa
	J772rzaPlndnYr1SA6GLiJBUgZeIC2KKhqz3J1rY2fpGEmwuVqj9nsWJieJ0/iAi+BXEuS0PZR6
	Vs5Vz2iSBLwgHXJnkGtv+mIA2PwltGzOULr8m47TTo2je0vdFoDynZTw=
X-Gm-Gg: AYBFou2lsjCIeRwnOBawqgO6TrZzKHOI5uNiZ6g8PLFIbeK5/mJlb5bw2FEs/dvsOZ9
	g9cPPqLxs0BnqW2cb8gJiAixGz6xk7FGACgnofYPgNSypP28oUftrxTpXSZ/AFhNJdddoji8tcM
	R8b8nDHP5qR+sidP/8xowiu3pWoxYFxiBvJOg2bI+J/HGIn+pxILpvGCyfUQs+6wRDjj+8KWOWm
	dBZKrasKnAKdEjJwnZCZ/Krd+wDjMZI7x/gkf/0ouU5KOfZk9ZWaUQbSA4USgFvjbGTNCkjluMU
	M+7F0Hf4hAXZn1I8gXYB+u8MI8u1kHQric75WY51OEEBbnWc1AEK2nIflZMEzqL6VBZ9WCPMNc/
	OhG07tFEdd6poqDzWg9bWf2nPVcdT
X-Received: by 2002:a17:903:22cb:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2e9a6d3b0c9mr57043705ad.57.1792386057296;
        Sun, 18 Oct 2026 22:00:57 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2e9a6d3b0c9mr57043315ad.57.1792386056791;
        Sun, 18 Oct 2026 22:00:56 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:56 -0700 (PDT)
Message-ID: <e4c681f1-b516-4a0a-8ddd-4885e428e748@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:54 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171155@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-171155@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX4S8mInBKQ2sW
 PKJwoS4JgmdxoT4/YMQ1TmpQ6Pp0DksA9Z3W5cjK0m3/mZfyn1vRFIHDEXe+GtWpx+RGPqUS8ic
 T7NfvPnL3D7iH8fIcnWt7KhHW53jaUI=
X-Proofpoint-GUID: kv5pZn0eR9FUsPW8AxDYsI3tuxejT_H-
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad5a40a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oUrbEBrvFYUpg2Fk8RMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX2/1Z2Gvl7IRG
 9zsWNQSXcOs4SGiFAebhl8dwyIYC7pnmAhAA3Av3eWaYafcCM2lWtrRQmJGufwC65OG1GX4zJG8
 CH2fTNo3J5BTE2AWzdDqn9/TgU5Ev+SPPGl5uhwk1RKcRafxqqMaZYxGZmiwxGxmTCfcDTznR+H
 rszQXxWwXrQ7zoVYTXSfmSOpIWrtYVr15F6+oM+7Q6Ioa47uDGaBcG6ZvNUzFh/3jrbyujPMeCo
 22CoSouiPv5yfy+ABmJnQtSR3pTL10ny6X6Qwy+N5zyPCoa0Vrq0ebaGmtUXT4qJ4xlJdtDX6cp
 BJCgHY85i7cSYmV1gBy7dbdzfkIYGIJRwXuCea613ic5e9RekCIEY5fHRmC1mewSMf5ooRKlIoN
 45GjF3AkwoRekTUFyc9LWKiLYihF59R9pKDBo15qLkVkwwYI+pFdIAWiooMPIWY6T08xD49KE+z
 9xeenElQ1uvtyRR+Iug==
X-Proofpoint-ORIG-GUID: kv5pZn0eR9FUsPW8AxDYsI3tuxejT_H-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190019

On 10/14/2026 4:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: silent fallback to PM8008 on non-DT PM8010 instances
> --
> 
> commit 4e77301709b8663667033b7dfed82cf937a2d7c5
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Add PM8010 support
> 
> This commit adds support for the PM8010 to the qcom-pm8008 driver. It
> incorporates PM8010 specific IRQs, MFD cells, and match data to support the
> new device type via I2C.
> 
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 2d6c01cf54f32..4179427f38911 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
> [ ... ]
>> @@ -180,14 +218,36 @@ static void devm_irq_domain_fwnode_release(void *data)
>>  static int pm8008_probe(struct i2c_client *client)
>>  {
>>  	struct regmap_irq_chip_data *irq_data;
>> +	const struct regmap_irq_chip *irq_chip_desc;
>>  	struct device *dev = &client->dev;
>> +	const struct mfd_cell *mfd_cells;
>>  	struct regmap *regmap, *regmap2;
>>  	struct fwnode_handle *fwnode;
>>  	struct i2c_client *dummy;
>>  	struct gpio_desc *reset;
>> +	unsigned long pmic_type;
>> +	int num_mfd_cells;
>>  	char *name;
>>  	int ret;
>>  
>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
> 
> [Severity: Medium]
> Will this silently fall back to TYPE_PM8008 for non-DT devices?
> 
> of_device_get_match_data() explicitly checks for dev->of_node and returns
> NULL when it isn't present (such as devices instantiated via ACPI PRP0001
> or swnodes). A NULL return evaluates to 0, which matches TYPE_PM8008 in
> the switch below.
> 
> This means a valid qcom,pm8010-i2c device instantiated via ACPI or swnodes
> will be misidentified as TYPE_PM8008 instead of TYPE_PM8010.
> 
> Could this use i2c_get_match_data() or device_get_match_data() to ensure
> device variants are correctly extracted regardless of the underlying
> firmware representation?

This driver is intended to support DT-only instantiation right now, so
we don't expect to have instantiations via ACPI or swnodes.

But anyway, to avoid the ambiguity due to NULL return from
of_device_get_match_data evaluating to 0, I can add an explicit
check for its return value and fail probe with an error if it
ever returns NULL.

Thanks,
Jishnu


> 
>> +
>> +	switch (pmic_type) {
>> +	case TYPE_PM8008:
>> +		irq_chip_desc = &pm8008_irq_chip;
>> +		mfd_cells = pm8008_cells;
>> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
>> +		break;
> 

