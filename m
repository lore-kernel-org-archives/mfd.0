Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658567;
	b=DVeEHXkfazXTZh1izRpXg31FJjejs/lK49ELFjAumbQy11IKec3tLTxaNOAvl4KTyDEa
	 BkuRCfhIXOd3EVp4Jan00HbmtA9sHEcVCj7UClHelEDAPUjqGL60TaVwiCcda9tNulRkM
	 EdklJ83cam5sybxqKjYSWdSdPWZLO+p9QWfa/NBt5Jirfzba7G4Gvt3xs//wyFhi1vxei
	 UZtb+G942LlD6bjs/CVzF5l2nl6TcEe0WYN0dmI8Q/7an5z6onUw8xh7keaCDeFdOxwMb
	 BPjT7CUkEtI917t6nKKN+wTy/w12h1efflrlIArz5fbXCxNzsTPQcjlgayOqIMPWRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
	b=VU63BSfCN6uHj3enm3UJYWrcLWAYOTTgZ4ox8FDrc0pP0X399w4NuTRNi4CItpJEcCmO
	 YDlZ/pHccFgP0OjJrFHXzhdbCGUm+ytjHxrHwTDo8XkD3L3A9lP9wwZVya3FNoFQbrC86
	 EP80P+1OttxXHURLXvgS99GQIZ0eb1D6sm//squmgK+Tq7KpgX9prjNfVjLPKHI6REJZV
	 J1ESwGBlgFcnUMsBNlzvf0/VTiTOSX5Qx22yoWNh6ZwXmZxgfKWGpbhFMW6ddytZyos1F
	 wvOnmdel/P7o/BCrVX5C64Hc+tEKlGTOkZ7IJ2oMm0VTTWcjtiIuRaaYSJI732hBByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EUzvbe5c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC808606A31B
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC808606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EUzvbe5c
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705xN1995964
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=; b=mgagUydebMG5Fzsr
	22bhGLvPM9MswVbY217xWPN6M/TTO7kNlOEh6Ti29k8WxCGeC7NUzmWJhl8qj6N7
	Lxv9lHLMPLjalrwwznZPzKkPjMhuv63agr2xXVMES6rrS6toDNRA74WqjTI1BJga
	DddMqposK0D3Kz1ESA3Y4GcbUllpezHoXpq+MFpSup7mWi62s3xpG6cRfPwhJyxt
	9Va5pQEn4xSlIQR41HU/f1+ms87Uz3gO6MD/iv1aQzwkCKnjy6yRtG8CzHsmh4lI
	8IkutG/UGk6JDTAHpROFRjVvI3IkUE4uJDVpU7Uq4sl9PFENqb541tkwqOJcnWxY
	8n7QyA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsfnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:42:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so1619703b3a.2
        for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658565; x=1793263365; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=EUzvbe5cl5Mo8+Q1iZg3pmmo0SDo9vbCEBfhhkJzXKthvdGx6GdWn4PW5qPGG8kKh+
         GDuqwin4r0Yl3r/ktbXD2R/5rHaU+0Rfo4ZhkUP3VdV90HUHed3b6YzV04l7ku25BAjr
         xgcWed9uKFxDAwfNfruABnk6LG5IkMb+xhU5ewsYFPjQQC/P0qTA+VamQC3fVmQjAr1q
         lP1TUVkzl4i5lJ+1PMxKUPxu57gnvEkBBseHs/T8vwFFDJMupj5gxdLLEuR6cXAPzshN
         wh/ScWtRR8bMfyeKDQ+CYRYpoL4eJ5K+hzndXGQCTnzCOyzZyMIzHjQlRzlEIAXK07wR
         gbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658565; x=1793263365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=vjBDBmpvosbMMxLEU/UpYvQEEagQ8eNJzO0nYjbbhPrhwkhvxsZ0uP3sB4luIdedE0
         bTUD1sx0jBVeIyQPVPP1ZfIWmzeHGkP38go+Xqo9McJ1so88PzhtW3GA/klV8UG6fTQ2
         mVjXXtR4tEDZLnZxmUxM+WllVhQW4eI58ukmdK3kfwFbrFGlpvRBxV2q3538vINN19IY
         Qhw6+n/1f+1MwDtYCjvvZ9Qqs4pV7Njq5Rt8tj0/IvHRCh/rqL6HDY+xHlxP9CHpYX/9
         fvzdYJgU2AwQfZU90NMs1aunQH9DStMj8ZUm6igRuP/7R0FyjjWcE1DJjebF7F4AUODq
         xwnA==
X-Forwarded-Encrypted: i=1; AKwUvBzfeFlU2ZGLllQkFtQlJb5AV2Qsx2cY1y4xyq3CYbG02b6ItHEHJ9Z2E55dbon4LtW9cYE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKs6vYgkQUu9e5Gigwj7ckBl/KGJL6r5ZyYjtrxn1XPK5q4Rx1f
	o2FTYqs5OaTUVsymYDolmJJzeata9/iFPp08v9UAZsxXtjb2NsvHU9HaTFWKblzs+BYVsY3zqFg
	dyJwiGykrLtK/S53Z71i0EALPB6LVQt2gUhxgaF/2wFo8gmzJQD4KGTI=
X-Gm-Gg: AYBFou3+PQL9zRbKPaAEluwzU/o/n+LAZ9OFBtbl5FS9q9ohRbWghwpoq23XYy95SMX
	Eb1OYFTeQ7DuCWZ1sa1N19AFqgEvUoiTD+b7HbY3A0FExOj9zVEXcNNL78hwsxfgMdO58mW0Wm8
	WTkj44gfLtDCl5osYvNUztxbunFTQNq59U58ndvU/hHZyD43/ZaJFBhIm7IZjUhyahC4EKKkzrV
	fqWyvZTOQknUnmfsKrdcIo80U+Qxi8gfJVGmBZyyRDNl0auQxkDigXCD2TMCQYBUK0zalRPtqnJ
	MSL6EH/WHa/mjyIAhFvliC+4fgElSQfNhBS5ixrBGZ0TNGirt2jb506C5jsDLr2Cur/fUhrQWTL
	fSAEY8Oo0nWbbDFqwUc9U8znWyKEV
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281533b3a.34.1792658564620;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281500b3a.34.1792658564102;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a274135f0bsm297617b3a.4.2026.10.22.01.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:43 -0700 (PDT)
Message-ID: <cc00f347-4008-4746-91ae-c2b583914cac@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:37 +0530
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h3R_lNXcicEkB2APPduQ4HxVOPFVjUqD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX3+u526yiveA1
 OGEfIh45RLl3d6NNVrFYD3LgxQhl3r88NCuPIhQ/5eitOm0fSLsrd5UbwL6+QvjjwfcdJfqYThK
 izOndQvo66yKVpfTvKGIvPc+fGlo1tA=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9cc85 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: h3R_lNXcicEkB2APPduQ4HxVOPFVjUqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXxAoBee0e8Epc
 GKTNL4QUbbjNqQ3mP2z5SNtPJrZ6KNckAaNUCWfP2DFWCrAPERRG47p9rikWbZYpmb342D9FUYX
 fozSs3Z1hUhqW34LBRizSMLsVWD9vm0YvBR3DSTHRfJ/2mYTeaoUZ/EQRCK93ogeLOP/feIq1I1
 jIGg/ldbQCB1P5z1ZfzTWfAjJwq3GqxNBkjj13gQv+Sh25HXeiriZObQk2JGjrpaCLNGx7HWkLF
 mkWdH/5egb6OG8UWYuacFpV9rNbmfiSA/vl8rHR0bbmBRoU4QvTfIj38luNaq0mhaQAQM5wjHM6
 EV/j+CzChg8O9fE4Mdbpz765B+cPIgzCxqAZrcACGxPDWe7Xxoew8irsroE36hBqnCfT9UtvUZO
 /kv6Jxuo4rCZTmceqoRtwCsWxj//frOwDWwNMqIgC1N/cb1gXxANoQOyG4Vv987vMctI2//HT4g
 W4WEd6zRrQoc1ajBMdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:01 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---

....

>>  
>>  	id = platform_get_device_id(pdev);
>> @@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>>  	if (!regmap)
>>  		return -EINVAL;
>>  
>> +	is_pm8010 = of_device_is_compatible(dev->parent->of_node,
>> +					    "qcom,pm8010-i2c");
> 
> Patch 2 adds a new `driver_data` match data struct for PM8010. Could this is_pm8010
> variable be avoided by stashing the regulator ops in the match data for each
> variant and using that instead?

Yes, I can make this change in the next patch version.

Thanks,
Jishnu

> 
>> +
>>  	for (i = 0; i < match_data->num_regulators; i++) {
>>  		data = &match_data->regulator_data[i];
>>  
