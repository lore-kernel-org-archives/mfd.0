Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029B34389B
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727223; cv=none; b=EUsqWP5TRopbHtBRJJfKrdtATbmkwW+Atv8f9A2ukv3TWE8pFZbNV4EVT41rB0qHoKQc0K1+w0brr22vuEA1cATHz9W+sHgFOf/cibpb4RxBdr8s2TfxgNjtlBtbFf8XuhPxcbAYfbYC98EhG8bEdiVhThKdiguhdDxwOcfSELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727223; c=relaxed/simple;
	bh=IK0nPNyVliHInYc5llgRFImUtg/oBw1zId3SZsnZemc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2+iLJmV4q+SFJ8REgE4Jq+K28FEt+zjk/OX2sPBlgWTZgyr203RXAkqHVfeJEklTZWnNjBMUqGMgc+eEGbbBd1Bc0m2+JpdUZRcWIkmgqLo0723DCKhY2Embqx5m1g3/4qpsaiu6MciYLVGFuliFV6sa9stzFwW2o5wTz/HiSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6jGh0aC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvgGPtpU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6jGh0aC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvgGPtpU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRb9765300
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 13:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=; b=p6jGh0aCk4giX1im
	UEUXR3cYR9ostzr0WwPUNMeTC2ZStLqADyNqeLXAuWslFmvcLOCRSbI9C9LAtlbn
	2yD9aSRJfArOChaUI0IOO7kuNkzsxci+L1TT+skYRM6oL1FSGpu7wbGV7U0ynamm
	LtR5jO8ABsmqGhPQJ/4S41otNC6IQHC1eUULxg/YCMtQP9j6Q/AnfxYLPO8Q2h9/
	In/CeWZyFGFW985RtvW3qda/Z6N7MHZSP8XnL3n/dYc23XSc7ElaTzSPgfsdMSA4
	MaR4E2/xjjno6CV85K5uXYCx/Szg5/ql4EjAD5XTDM0NyPYKfFFmUDAxbSu93wg9
	Dn7PbQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2s4nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 13:33:39 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-451ff8b9acbso5686179fac.0
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727219; x=1785332019; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=BvgGPtpU419m+5CGhAa/gkigTaDCDqStQ8RubBbaEviZpC4y5fFPXIilwWvE0jYxI/
         asg31Muwxl8Xk3i1yujQ7jt2ILWp58IiI4GDswZowyyFtmRil04XxfLs6bLnuJxXDX0n
         oQXSAHZP9UCA/xwya7NIsqpO0tGB2c/AhQBUAHLR9XcSghwu8qIfuQFUXJf0cVq7B2+O
         eHCrHOzuvFw0uolK4dxnamUst+EoAUmXi/9I78PD89u/J7Yxp72KBZ5KMb26Nhr4cj5J
         hgsHIxULBTTXO2GetpgkRay9rTXgs5+jddKnRU4poUn2oZehaBaBVtQn6pfUYI7/0uTw
         xXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727219; x=1785332019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=YWSrhuwbmRfF4UVed6hL+eiOfRUsY6dBkR7AdZU2unHXQGo0wL5FVJffB1waA/uNwB
         0KKJp1Z8huInkwCg/CwmsBC1MzIDLKq4G2NIYOKWQpp10XiCfe9hzBy35U3prDz0ACCH
         k9xsEOcaqoIx/+L9hecUOhzk2vSasV1u/DpUs46UFGj3qxKWb9p7DMl8/QmC/GEkNeJK
         vNuo2fjb8efxdRJ3HUZH3HlkYo6sEUQ0kYmaRfek4SVPnY67y+TwvXbGLnr5T+38KoJ3
         Gpl4tA52LR/uv9/ajKy2xaqYv9Cnd/UlDMuCN3ovPbDoijYt3Wgc9VYgft7T/MLy8Epq
         oIOA==
X-Forwarded-Encrypted: i=1; AHgh+RrC6Q2cKhcVNZhSCXM1zRyvbS8E2mPr0e5ivR3Wspy5zFR1rPXXEi9hc+1CiyDnt6MGKAU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcB7gpfC5BZifzq62d8ikGadboQ1dHOi3w2UjI/OQKii8lBQs8
	s1TYitBZgkEYc9s6sXGjEoFg+oagDISIB4ZNxhTaMte2eXIuiPaYEqW0F9c4fFSPxFSskwYtNu7
	dfD5cZcUgVOMvjwcftYtEbVclX52qFZt0VFi8oMYP0hJRNNGMdrwDDeY=
X-Gm-Gg: AR+sD11tTyoAEOyuDB96ehYvhd6yslewU/ijZjXKgjRcDDTzv4gdzJjOGjmiJkS3HIL
	2G/z06tiow5AJMjy/WIpO4y99C9GQU0ODFAz9qsFM8qBkQmf/k1Xzc25Xlk3UUO/asQ9CrqxlCk
	Sg0Fxto/yxdzVxDb0atWG/up6GQZhSvhsTBnaAzmfyh9LIx6F3E6knIBvtAW0nOxM2tir7eX0HP
	8okGLp1b3SvZDdwRPXtWox1O1w6uUJEKZJ9Xd0RSe1OhmL2asBJPbHkgAqtLQrmCw3EFSUsO10Y
	shdQaiEZ1E/D8uV5Xsb8Ppm7J58/u95wo6sdvjF0CL7aRq9RlMVmTdHK1fu/DAXXPOOipzBBvmx
	eLKJwuy3G+/UeKxvqPkVWt6nMKiJsei2x/XU=
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653209eaf.35.1784727218599;
        Wed, 22 Jul 2026 06:33:38 -0700 (PDT)
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653117eaf.35.1784727215447;
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa79a09cbesm1395149eaf.12.2026.07.22.06.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Message-ID: <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:03:22 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
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
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX72afIQ3miBzm
 0QW4gYwFal4zDltjyObql6QgKlL9HhYcyoWhkEHCHrbcO0ZgBAtuZ9OgmsbBvVX9nHQb/5GoBpi
 rod3DxK1QDdgmicUrbZ1Vz831/zfB8uf7a6ICU3dqqWqg42smomsJ3DKWTcVYeV6gLuzsZzYPXl
 OF3qh540SGD39XGmgPznDHI7khWF0y1/nas4AIS6nio//4aNKWLmIri8fVbHVsCr5NG4PFITAGT
 Tx0TS3SJhx+6VC/gvibVJFJepgw/apZPUVao1mKw1Hsh5CqyrbTZEmXfvzwIt/Ey7oufmlLQVXD
 rAqMASVd002K+GxawqDFIERRo7TPap/j0sxsfCozMEintk4hDyVP3i9LguvVy8BxOmX8u8xcFJw
 IW03GOXtVo1PDD9IpkiQ6/DMO/a048Bj9YpVJkEH+K7r/aLumH94i5YcYdicYvhkoEl5FgHYWNS
 ZDhDOU510FNnSgAbzbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfXzFE+jJDjNyAZ
 dIGKUu4lI4CM0ZWn8As0cFwCiTB1wmRqrIbiQSsIkXPxIml1deTgLQUODosyFeLN/YVYjPZxMsI
 aFQJHYClIi91Ogiyi6YwPbG+qEejbmA=
X-Proofpoint-GUID: Zah5Sg5Kp5lAHv78tpIaxYzgAKLneneu
X-Proofpoint-ORIG-GUID: Zah5Sg5Kp5lAHv78tpIaxYzgAKLneneu
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60c6b3 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fs1vR9WLwBkDfa--pcoA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132



On 22-07-2026 15:20, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
>> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
>> cookie as arguments. This cannot be implemented via the reboot-mode
>> framework, which supports a single 32-bit argument as magic value.
>>
>> Extend the reboot-mode framework to support up to three 32-bit arguments
>> as magic, per reboot-mode.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>>   drivers/power/reset/qcom-pon.c           |  8 ++++---
>>   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>>   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>>   include/linux/reboot-mode.h              |  4 +++-
>>   5 files changed, 46 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
>> index d260715fccf6..ac69b5f39fb4 100644
>> --- a/drivers/power/reset/nvmem-reboot-mode.c
>> +++ b/drivers/power/reset/nvmem-reboot-mode.c
>> @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
>>   	struct nvmem_cell *cell;
>>   };
>>   
>> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
>>   {
>>   	struct nvmem_reboot_mode *nvmem_rbm;
>>   	size_t buf_len;
>>   	void *buf;
>>   	int ret;
>>   
>> +	if (count != 1)
>> +		return -EINVAL;
>> +
> 
> The count can be different per mode. Because `struct mode_info` has
> `count` member. This single `count` check across all modes may not be
> useful.
> 
> Either drivers need to use count passed to them or drivers needs to
> receive `struct mode_info` in the callabck.

will add a once more write function in reboot-mode to handle the 
multi-count support. If a driver implements it, the multi-count write 
function will be called. And no change in existing drivers.
Does that address this concern?

thanks,
Shivendra
