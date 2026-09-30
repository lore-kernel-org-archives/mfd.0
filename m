Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEE63C378A
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762546; cv=none; b=pSO9j0bpVVMUCZ3C9eeK95ex7v0mtOghUIfHFz4rjySbLkR8zEla+lmNoD4JTqmmr5KjcwGh65Ln3ajX3AhvvYb+YIlpDXqpe5ZBRlCDFDJsTHrxOcnXYMHPFxMzIQcCW9Fv9DhX5jjFSuAQ04DCHWTYiMq5tgdTUFWiyXFfcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762546; c=relaxed/simple;
	bh=eJocVqgZC1LZ73uhvhGrTfsM5JBh1CAAbm6cuy+2k/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUmzs1/Ik7HSZ61e0He3zfszXoglryQ95Q/tyWYYP371tVWkzAlUs4dQvaZWXxlXl7jQf3P+zltO+TDASmDQ9/ZNk+JUpjig0OqZsYdPltPZZcGKpDDpQyYBX0fC0XdpgHyfTqX3xzwKkxhrubCYPMftUWKXAR6SRXZubOQYewI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kK6mDofg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNRs4fb7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kK6mDofg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNRs4fb7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWiU3489202
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 10:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=; b=kK6mDofg1UYweraG
	FTYCsXqg8/0YygMTj5WZt9+hbTg+7Qdmeq4YjzSfCCgwUrtRb+nOegy0a9kAPzhl
	gdbIwnmL6JwOt8cAl1e0TA053uR8sK5zU4fmA8ejq2KuIUd2oHksgLk1cQWHU07T
	g7bkBkZcD7zH9/CLMm1A+UqJ+y8XJsH18kU94M+YUFp4BX80Tx0PIcT6wfAzz3jS
	1uidX+mWoPWTWpwIbxO4IuUpFIQv3Czert8/hGV/WVzYXwyr+144TK75VEgYwgR6
	O+LRnzHd6fdo7L0AVbK4LCJCgdjKDwGhcq9z2faaf6XdCCukOp5j3XcqQUhchvRQ
	d0sVew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97un7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 10:02:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5392391a91.2
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790762543; x=1791367343; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=;
        b=gNRs4fb7j7Hf3+dJrl0JPCyFNGheHdautT5te2VMZ7Nrim4s4eovtKN/0CqJ9Qdiyc
         NVRd/IL1QfOOKii5KgA55/EoNaVqjvmJeJU/il1L6xQe6ST0i17tXJeX/5Y9c+J9oXyE
         I8drkWgz1ubmLIkmcUZiqNVNGaWFC8U718pvk01+yP1mJ/3rUoBcVmbcsHV/i0vtdQ2e
         V/bghZRKxVsz2VH7FQZJOL3vhbLDApQuTYfIpuJQ02TYTViCW5jO44yygcvm0yUYj2QH
         5a/5EIxTUkxvjrGfcWeazsiU7yrpxV95+LIXysWQWNINtlNy+b/8FXj7gd/uq2rk9m5S
         /FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762543; x=1791367343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPe77bI+fMFp1YsFWGh66THD7WQb0kpPqkpc9dkIEeY=;
        b=BtqB6NOrg7KzkK7DXN0eivCVOL9yIsngslmK4CaIeWk8VDjgNwFkL2O0A+sahUCTJV
         lUxDAQ+wwOUuKYtozfOk+Flry54CJFJXRU5CQh/NnOTcTKTdtNFcVJUm/cIbuwMxNBlQ
         rR0vqjggH+UvMOuJEOhxlVaTLzZtU15yCPcHWVUiS0miROXbu497IuONs0sIZwvgmzpF
         D+xJ2xrLucbNl1zFA47oeJrOaSOfb8in0sFR0qFXw+WUB/jj4C2qwN2WE3tqUx29lFX/
         kGWmPEAfGfgsXWt4aZrRHwIR7TswxNdactWKXTxzJ292vQ8cyfAi9DI3gfAuymmd36oA
         KpUg==
X-Forwarded-Encrypted: i=1; AKwUvBwPkiPa6alfen5SAMWrKQGPf3pX+MVmkFk/3DK/0dA6KO2kJD43yUqktI1ILj+6KEhATRA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJwj8p6BxLvoP75HwCcWGDmmoFnRsI+Px6s5bQ0NalWdV9Na0zm
	I/jiU3C26P0iqp2xg0xlYD2njqUgOjix6np5RkY6LeIhEmu146dv+jttbUc//8Se3reXuuEQLNV
	ufDOfNVYdvK63ZNWiDHY0nS2xEstbJahMG21BFUSBrMzFnPR7L0pIVUQ=
X-Gm-Gg: AYBFou380QZryB8WAl3JaRMTf2UpzsBgo867STTib71ohef3fEYa9XKh8zc3Z14inHG
	FdXjSDCfhPl8jIxPQJd41CaFZzRVoX2ZMtNfe0wR9S3VkfzlSiNsPQma1yL1HG/T3YypnZzdExz
	yfYTGOKc4B8EqRTZ80/9IIfJJ6qr1igt85kIER8TZxQ6FbomdaaplQtBTzYu5HcF/KOUk91vqj8
	fthzLB0yrVfMpmVA9KHAfeQibgFdrOlu/C0eY3Alzedx9Hmd7/BF21HhSlYeV6wXdxlTP65wvdT
	7XIt5koBWuS8/WI8Bh55sQH3Z/C/36FshlZYGwVNzdvpJuNPeoGeE2oVpaZSXXPZmnp938OWPZi
	+r4vYpd7YdRCJ9yo6b5plvmkO/84GT+YGVg==
X-Received: by 2002:a17:90b:1d46:b0:3a4:cfc2:3517 with SMTP id 98e67ed59e1d1-3a4d1b5dee4mr770907a91.49.1790762542425;
        Wed, 30 Sep 2026 03:02:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1d46:b0:3a4:cfc2:3517 with SMTP id 98e67ed59e1d1-3a4d1b5dee4mr770865a91.49.1790762541848;
        Wed, 30 Sep 2026 03:02:21 -0700 (PDT)
Received: from [10.92.215.224] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cb194b86sm2880249a91.2.2026.09.30.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:02:20 -0700 (PDT)
Message-ID: <050bed16-c250-4cab-baab-d3b766668f17@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 15:32:11 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
 <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <szrhaamkkvvhwcs67mrptuigkmgel5jixo2bqgk6rwi2kn3jdu@a275fnea2vlf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ugEqUZvch1KxTLvU0pY3_8CladuXIYpZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX/uL+xBIn+SJK
 aV/LnL0fCVVSBYp5PiHMAcm8/91Sw4n9kyuRtuNKJaDphN0nXcDGAPcvoMC7JxBS6ALmjIhcYz4
 U1qt4vvApUcol8dYcy7a6uq1rE3fz0UCGi325Yt9e5Og7U9atVNVBnkUYyDZNFw2j5k2B2yFDjI
 +vAibd1Efb9YalWrEXiL5QOAUD3RuqGeL++y3Xh7AICkHoH+luJq/FMzLwdyL6Nw/aIc6TEmTt8
 lhiwHt41xgUEnEm/URi8fbfRziUtr9SJtYWTO14qF89QljKSx+VKC7ciUSApUL9IIRT+g83JSr9
 I2FQMleyZO0sUGHTU5D/roJBMz4+s5/BPdj3jtRKHotC1rAyjK/twxCF4dGV1nnuZT5tHEKolm4
 FCa8sINYt4jUAPRL2jKjv6gSb2OhvLawFL/Csaygul/9lFB8moYtlZNQ7mircQAxqkLItbcfxd8
 8oMvQ4tshz8X8U8eKZQ==
X-Proofpoint-ORIG-GUID: ugEqUZvch1KxTLvU0pY3_8CladuXIYpZ
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcde2f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9t18G-HS6d7wqxctyjgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX7C01iVb5DmaP
 fL9UkF/Uw4h52mP09VzcrEyvKRL33UUYEAYRmjlzAoGNGRCODPigKvyiogmgbrK/LkgCp8m/KZx
 ym0zScsR59ZyZyUH10aUTUkQJymBuUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300039

Hi Abel,

On 9/29/2026 6:45 PM, Abel Vesa wrote:
> On 26-09-29 18:39:39, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> index 1a24e6439e36..52b5fc1ef9a3 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
>>   			#thermal-sensor-cells = <0>;
>>   		};
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,pm8350c-bcl";
>> +			reg = <0x4700>;
>> +			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		pm8350c_gpios: gpio@8800 {
>>   			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
>>   			reg = <0x8800>;
>> @@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
>>   			#pwm-cells = <2>;
>>   			status = "disabled";
>>   		};
>> +
> 
> Drop this new empty line.

Thanks for review, will fix it in next revision.

Thanks,
Manaf>
>>   	};
>>   };
>>   
>>
>> -- 
>> 2.43.0
>>

