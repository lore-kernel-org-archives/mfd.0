Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F94477FD
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386129; cv=none; b=PrGncLYwGSaJd/fr7btr28niKpgfSUiIipDKu8PPN6d069ccJzgcHgYS56V7g5JzGEXdzSU4vOocr3fMs6kwcP+oPQqoOnpg0nOlt+CrFL0gC4ZuUp03fAQ1uL1e68g3dxbPe5ce+f58hp8B+UHXyVPlXC12gtS5/sLMO6cp2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386129; c=relaxed/simple;
	bh=kn+5ESPtj0RJi5bfjx0hmp39+NNbUKQWRWiWu6lWa/A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m9t3BWgC7FSASAVnGHVu/37SamSx/7Bb459PgOwbz5GPJ6484S+pTsBOE9CCdgQXglUmLrYKS0YgJRVCVwhx4JBcqXVN8mA9Cetb10hl1u8WrST1tKMobLiJvKnDgwLdSSYTZ1u/l4LEKhT09BT74ymI7vDEY2xlT9wzYSETLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsxGsQ3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYjrueax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsxGsQ3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYjrueax"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j23P1749031
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or4asT3KXALdKFQAYnB0KiA0P++DP8jjRqXZ1+HPl+w=; b=GsxGsQ3ZT2d72ntA
	vOk5NPWBt31GRMqA0xsZeC9RYAz9haqBlKgYh/M/xN46UgSqdVQkmHPro1UsZZV9
	ihIsdPlDpDCuIXXSIadLIGd1PhTZ7QEiGd1jjmtw/PIeSQ3VWAWn8QkWYeGT0uCV
	986bCuOSyFiQTgz526cb6J2ONVNr7SfM64Gh8GWbCHpHAjD7ZAMcLKmiTlSGr2na
	3KBOS7qzAjlx+Jo9mvKmH3DzyIzhBMlV0NzvjsCqD+CfjtyG7Q+cfSUP4d7e/IAz
	QIT2z1Q5kfowxVFcGNXca7cv51P5gqpaNNeln6SiDAWHRv08M1BT/X1kgrlKdvpU
	G9l23Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183cw7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:01:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so3034761eec.1
        for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386118; x=1792990918; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Or4asT3KXALdKFQAYnB0KiA0P++DP8jjRqXZ1+HPl+w=;
        b=NYjrueaxChwTsr/SV1bPDQj4pPLWn9Zk3JFh4Yx2QluiAL0DVBXs42JnAwPSbmTy6M
         kAMQCsMXuMtV6S/yk+5S+wT3iO0CSbPH/sXoeYFYwtbTVydjK2e6zJjwYuBf547LI0mw
         mhxYFqQiy9jEJIiYhir9XXBIGhTBC7eh2nBuVpyFioMeiq/oXivwn/L3HOHPO0M+ZhaN
         Ly6TJjoOdH7tti2el85hJy30PY7wsA+okizQzws+HBAd00RX3rOemXnDw5RRLSP3f+DE
         EGWAkMzEmOspwkySxKY+4xHwMpnGjW4hvdjyFIlndp7JxsSwz6eqtIZodQ5CYjxCEVLI
         m5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386118; x=1792990918;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Or4asT3KXALdKFQAYnB0KiA0P++DP8jjRqXZ1+HPl+w=;
        b=g066PsD3RoPskrWXAOSZbBnydDPX+wjmfjx94WKxN32DRvMvzx4p4RbSbg5hmGdnYu
         mSu61Urj/MalPdVW5VI1F5XbHiZUoW3suBmhu9q9SM0txk3QIcUGbysOAM44a3VgRJDv
         QYwK6OtyrorOt18A3ZEsvfn9/acem9f+jxfQ9Gr0/xEX0FWz5/MCUzs3luMZZuEPIBul
         GqqVz2Gz3+A3ontBpz3MdubDPQNFWdS+9ZjEAoEHWbSX5E80+CRtNtRlfX/FX6lMN8BE
         5gMcgsfomkUMrsZWw1xp81f69uvCp7KHoZTNwTGz6bW2zv2nfjZ20AKwOhPa+EHlZVMs
         0YDA==
X-Forwarded-Encrypted: i=1; AKwUvBxUKotx5IdsGq+FcqOmhI0hOeMDA6UwQz7nrRlNvA2o/FY7vX0HfhC0G84vvElHuAXdm6M=@lists.linux.dev
X-Gm-Message-State: AFq9FYLBawaEGXf+KIVTytLlx26fzOqG2QEwl8jB5nSYOlH3Rraqhi9S
	wdoNwPp0nK7LqRUl2rIzBEqwxIoUCiLzFrXRkiu/P8sNcEtNGGiod6QCS82AsrC7HIZieUfQ20j
	hvnSxrqDbvUTQ3E4Pt6MtRXd1r/wvEfpPm/1z1VFFGkvDOY3PdXSwdqU=
X-Gm-Gg: AYBFou2Snc9YwKaAzpIIxqhPSWowMsxKp9sV+lFBxezfFQdZ9NqUNbTBOiTGGOlvNr2
	THfvNIIjTZn5r4FNVbaBortQilUBxTWoXPVYnEjTLL6E4jOqZ/yfuhOTt1YShS39FSDfP2T9+bX
	9YAhmp0ycWxyOiSkcoTHZVNaGfzBbUmkCgU/xupKxUIO1FIE7ciWkBi5Yp3DLKUcRoXufUyupW6
	HsFcS5+l9qV0KBIYxqoC5ZhtjZANKXghTbyIlFloWy51wPMz2uXfSExVFQKvDCn8VHBspEv06xe
	Mgc2/7IYW9CH/FykbyaBjzpMXVrHWm5CvdboXpvexqf3dHE7XKaX/N9zV2bvBjbfiGLswwGrI2f
	uMIkkC369gzG2lwzxmdarJTJfyLY1
X-Received: by 2002:a05:7022:28b:10b0:16f:c9db:c5af with SMTP id a92af1059eb24-185118eded7mr10365913c88.11.1792386118153;
        Sun, 18 Oct 2026 22:01:58 -0700 (PDT)
X-Received: by 2002:a05:7022:28b:10b0:16f:c9db:c5af with SMTP id a92af1059eb24-185118eded7mr10365874c88.11.1792386117582;
        Sun, 18 Oct 2026 22:01:57 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm38132385c88.11.2026.10.18.22.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:01:57 -0700 (PDT)
Message-ID: <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:31:50 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX9ZDQcxBWfdVz
 YIdmU3iOeMQrpKihxuElOEfB1R6XGSA9yrnTrCtqWGrKwdXEYFfJFDj692UMYOZt6q4sX5nR9sO
 yMgdH3UipDmrSAfmIv8XFK63HOFDe5A=
X-Proofpoint-GUID: 6j4rVDCLsF0LGGLONF2wKDD_t3_RMoSD
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad5a447 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FgZ6Ug7uWDD4XhXpjZ0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfXzBBi5osGvaVt
 b6Ywc0tlJQrMYdnRNyjTqppXFTP3PHODot9TwH38Eaw/ub7JLII1FAhqz4V2nyVblgCecZsi49L
 kFJSkUX9qsPkgrhCuuUuiNDhx5D6+8MqF8onR+sfaJZoHHiHHYuTolNtrW+7tVyZOWB4XBaWHfu
 WKJJzlvltSxTvK2B4u0a0HeB3gLBPLohIroCxta5zYPYZ5HBUM5SkBBY/ZUMT/vUfQpODq6Mn6I
 /8dor/lczxK5s6TgzRAID21Gp0UXZ0QHImElHm7TTaAOaqlG9tcVKgq8OxyVKTBcGqz3k8wTP+f
 re1Z2Qjo0+lmF8cxH3I8dwgRZolucX7ZRT4Q42Spyvr5yUoHRHpc86bvlImabo1kdQ3nFqsdqv8
 FAQC4SvsTP8OgvKWLTaqZt9ej7qWFf+2Og7HrM671SmV0UNpKqsxr+O4dODblPi/DIF1AIQFVQt
 fAXlTixFBB+JSBjGb3w==
X-Proofpoint-ORIG-GUID: 6j4rVDCLsF0LGGLONF2wKDD_t3_RMoSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190019

Hi Konrad,

On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> PM8010 is often wired up with the interrupt pin tied to ground. Only
>> register the IRQ infrastructure if we have a parent irq.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 60 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 4179427f3891..8b1bbb4052a7 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
>> @@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
>>  	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
>>  };
>>  
>> +static const struct mfd_cell pm8008_no_irq_cells[] = {
>> +	MFD_CELL_NAME("pm8008-regulator"),
> 
> There's no reason to not register the temperature alarm driver
> if we don't have an irq. It will not be able to carry out the
> "alarm" part, but one can still poll on it.
> 

That suggestion does make sense, but I think it would not
work, for multiple reasons. Let me explain them here.


If we are talking about using drivers/thermal/qcom/qcom-spmi-temp-alarm.c,
the driver has this check in the probe:

  irq = platform_get_irq(pdev, 0);
  if (irq < 0)
        return irq;

So its probe would fail right now if it does not have
an IRQ specified.



Another point is, PM8010 does not have an ADC peripheral.
Without an ADC channel to read from, temperature read from
this temp-alarm driver would show a constant value most of
the time (37000, for stage 0) and this would be updated only
if a high temperature stage (possibly around 90-100 degC)
is crossed, so it may not be very useful for polling without
interrupts either.



And another point we should note is, the MFD cell name
"qpnp-temp-alarm" used right now does not bind to our temp-alarm
driver and this was intentional, as explained by Johan Hovold
in his change (mfd: pm8008: Rework to match new DT binding),
in the last paragraph of the commit message:

    Finally, note that the temperature alarm and GPIO subdrivers need some
    minor rework before they can be used with non-SPMI devices like the
    PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
    rather than "spmi" prefix to prevent binding until the driver has been
    updated.

Since these changes are not yet done, we cannot use
temp-alarm for PM8008 or PM8010 over I2C for now.

Thanks,
Jishnu


> Konrad

