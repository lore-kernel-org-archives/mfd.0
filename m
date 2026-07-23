Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901C4137A6
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812526; cv=none; b=ifuXTTosAHWHrGd5henv9zMMdhxbSBQYInjbnOvweqVBXGKSaP3pjcMQb2Kwbo720IAaBfrq8lyEySA5Tw0kMqI5AYo8pPinaWlVZuw4BeZcRzESju2BzVdXD0RFtaO7Zvazu+uscymFhqM+mrU//aKL7Tzj4OxLAr1CvqngMoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812526; c=relaxed/simple;
	bh=aME50YQWurrWPMxFmSklDBm9jntBrHtiwEEG+vN4Pyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYhJU2RQAiyBBdyuKBZxOGChk3k91/NMXihp+W63VGOn1u1etkwNbsAGS+vDe6An7s4fp7Sboqn8B8IXRJAyfX1JMNssg3O5FsQckzzXYmeXy5cCKb0eFTE7R83ag6me848BsO6DMgTf698ZZ/EAckZxoNU6gfBqeprR5vkm9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvnfJFYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlULUxtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvnfJFYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlULUxtq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvVlf1030654
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2Yu9Mq1SFTFe8Mrc+cdWZt3E4WobO9rD3AAbFfTYOQ=; b=YvnfJFYlc6uMK5J6
	USf20nI4P9ev31sIlk3UWubOmQvdg4ONcUSaWbPX/M3TX8HH/AD4tZGHQmkKmDnM
	/PJLc6E5vREwL6ZeBCZFEYoZ79EDzNMwIBboa6UToePWcKHMGv4gjgmqZOvsnisJ
	z6pD6BvX1Cdx5IKX0s5TRnWO+W/pWqo9J4JDKZJaAw05lekqmQf+U/iTcN5AF8lZ
	cJPzNFlUURdUpoLxzaLGzdSE7v+cScvu9Ds7znmnMPhHsvs6abVn0Y4Ttm4DHNQW
	eu+8DZqpL2xazJLJNrIx2GXsKEsGF/htrKWTLELE66umqLD67eHikWNqfi68Au6f
	ktpijA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv831-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:15:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so10313501cf.2
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784812513; x=1785417313; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2Yu9Mq1SFTFe8Mrc+cdWZt3E4WobO9rD3AAbFfTYOQ=;
        b=KlULUxtqUH1dKEq4CEniyVmJNj16y3zui3seOEsh7rU6ZsiwxCT/Dr7VusP4i/Lq4B
         5cC24P2BlVcQU79nYzxP3zcI3SAAUNcseEOoR1RsJRkVG0QIRHlZ6NlXkYb4vQwOmRkM
         PBAzOUkQVuiOth6WmBWUttSxYomGXXk6VwZWhezBi3P0rgZt1wldjsHWuQ1W0Iux9Aes
         WAmTva1XGujBnxBVr2PmEj+RrkzlB0dHhBY9Ntm4KmHIuwVZzfJYVGyX/3eImO7WIpeK
         ZsVqMwWh1ifazV7tnW7nER1HfugopbGao4PCdDin2xhMt5xZAmunpSrMRIepho9oyEl1
         IZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812513; x=1785417313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2Yu9Mq1SFTFe8Mrc+cdWZt3E4WobO9rD3AAbFfTYOQ=;
        b=JsI60uHd4ydJ8m/EIagHCIQb6JVvpRa1mU6CIPZ5a8R2OG42CVZkux4zFfuyKwGz2e
         3Wvm4hfDM64nQpPx/agWRFZbouPFJP4zIQErz4vAuuxZcSVOnpbEzSStQDoZpWCMeXLj
         yiq+79+kbZMWJ9MIyFpxmeEatL9HnUKr9ujKj9eEaqS/npeK9FdIiojjwv61aDg2hdGS
         KCTOcSehWf9ZCZniPSS6TqGB2Scia+ExlClPVly+52+/JGSnVHLebGEks+65g0cPK8kw
         b193PsHBPTfShQ3lOOyJuaTQ8kagm/TAnmT1d4nfc2wBGaBE0htzJcjelg0uj9CYbztv
         A2rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRd75o+ftOhRmpXmHUl5BkbcDO2EBHRLfsbYUpXxCMWC8sEIlXyVurU1jOW7PtlT7NII0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnZv6ND4DJtByJ1ojigK8+lsyh/Hfg3LiR991t1Av5RLv3+LLP
	YiSZdIet8Fq5mcvfcHXOtKuaRmoSCMleI3pRvuYv5MFrDM5hWSVbx3721/6eeTBY5KvmZ8FXayo
	gSfx366vxfgmhrDyGMHj6/ywCQ6RBJQoFNveeucoVitb/xgHDVBSo+cs=
X-Gm-Gg: AR+sD10pZu43eERev6bayjgDPlHD0ETlhSZLOXcKRor0P9zc//RkPfAPaHQgNMm7IfR
	lTLBQNc+NLpTNZblvQbdyvXqBa2iIItc1mudZDy782vBwWHJB9/BUvYQYBcm7xQZFytcORrJw81
	I3rZbzR4uCuW+9ItFk8uxV37UMgmmhq4w5XfcMIX/Dv+KjxoPwMmNjpR+61yANF8FvL2ifcdQ7T
	diIxxdkFbtavpfS4r0dJGXpLfaDF+Fq5neSYdHRu7XLvSPiGUusaV/W6G0dYjlXJeZj7dKRz5nQ
	04pLW/kf+Uzf3eEYJmuPDdqB/wG+Byk2Vc48io2hDcojJATBddfHs7lbboWQTtZhVha8KeN5s5X
	pRM+ck27ELibyln5xSKa0YGoUu982UmWI8Hc=
X-Received: by 2002:ac8:5a0d:0:b0:516:ed02:c85d with SMTP id d75a77b69052e-5283ddfb06dmr27815661cf.3.1784812513348;
        Thu, 23 Jul 2026 06:15:13 -0700 (PDT)
X-Received: by 2002:ac8:5a0d:0:b0:516:ed02:c85d with SMTP id d75a77b69052e-5283ddfb06dmr27814741cf.3.1784812512670;
        Thu, 23 Jul 2026 06:15:12 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31c73sm1031686e87.52.2026.07.23.06.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:15:11 -0700 (PDT)
Message-ID: <01237c3d-7248-4460-a115-512ca3d0a706@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:44:53 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
 <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X5ZdFOFHxajatBGsDkv9R-w0MhvDp3r0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMCBTYWx0ZWRfX0S8goJzeX5eD
 ZR+7FvO+qZq90lljrluxhvjnsCCwjm+F80HjwXjGgF9quQrYaQH6hUvyGpDLYse5GT/EmuRV+7I
 LQW4gsBbpIyUMp6358W2CliwD0UMC7A=
X-Proofpoint-GUID: X5ZdFOFHxajatBGsDkv9R-w0MhvDp3r0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMCBTYWx0ZWRfX9cHrSKheNnir
 wrNfLF5t1gjKdqvR/J1kRpY3FLbAKNyq77AKrd9dCsjFxuzDFiM9mn/RzjhRBfAPRlHe9DEFWko
 YsgIk06J7P+ksAvPhnk/fe/HXb8X4esNIKnGne6WNi8lgY1cjui8Db64ecp/ewQxherbvLgcVgr
 wZT/ijafYwCfoWoPiWEXnQPnvEvJU7jVVV4W1J8301mmYbzdhT/WEmyv+SJTKAC6JDAnvbNqc7Z
 LszbSV4fT+wZR9hCCGKpnYN82zRuhV4Vm4+RstOqqVAaFr47kJC0eug2XZ+DCzk+78iaRBuiUqd
 j/CuRucGYenID7Tm18ctJWCAcLLFMUB7DvSsV2xGWTHaPBIHzeZVVQMmpHHAbiFVkNKr9CTK0J/
 fFIeHZtfwyJDuDT6CFLB7wXzXKFvYjFadPscQFQOewBf7VOIwjrdzfbIHwu0YaSfUu6T1E8GJmk
 JAXpI4UN1Pym3Uu5Qzg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a6213e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=v7qggGzDPz5B41Fs5RsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230130



On 22-07-2026 14:34, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
>> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
>> index 34a81e4b4f95..b216c7595f7e 100644
>> --- a/include/linux/reboot-mode.h
>> +++ b/include/linux/reboot-mode.h
>> @@ -4,18 +4,34 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct reboot_mode_entry {
>> +	const char *name;
>> +	u32 magic[3];
>> +	int count;
>> +};
>> +
> 
> I see some where `count < 0` check, should not this be size_t or u32?

--
count = device_property_count_u32(reboot->dev, prop->name);
--
this can return -ve values on error. and we store the count in info-
 >count. Still the count in above struct can be a u32. Let me review this.

thanks,
Shivendra
