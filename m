Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5B44D00A
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122155; cv=none; b=sRPJCLao0OrwvYredrNdF0K7Ygk3DIwbjTjYA8UztGWmj73NWvbccbzFwx/y+SnJvjqapR/jTTaQKhNaMRf+QB99bMEGhK6LKF/UhwRjjuwuSzPc49D4qbTLWSxNZae1kDzgYHFw46wZu9VKLToCE6U7cKWIeuJbvluX85zCv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122155; c=relaxed/simple;
	bh=GzOOsRGt7BjS1JAsyiCzz9u/awbv5loIcnCVceWzTEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SW4X/DbOt4pJrxVWCGqFOJkwkChu76B149UOhhIl95F93gtLfNkvgxRfYIBqal08+74Xn8xQNquhcbwdy8VltpHxXRGivGkoPWm1voWpJFt5EEkR1qYjN9HM4+v3Py7WhQZbge57ADp6O8jpSgD6O4f2VBVx7ZlxVj4N7iuvrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQRuEAmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPBSsth2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQRuEAmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPBSsth2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcvaH3579143
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 13:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=; b=UQRuEAmPLakw2Yq9
	WGKbJjpnzHeqkGM10aWtkSr7o25OTdPiJpRneCl6UpY+nAcZerSWlQZGSS8rk5+Q
	91dRhgRrJmyqT55CT/N56GZU9xgIOBaIcpXc4Aufaxrov86WKCrAg96fGbCb7Kg6
	Wgztym83nrAsPKy9BghxCVK2FYa0uOdaTvqbt+TvdfDajvV7pqoyfJqulCNRU9GY
	yhOpSEp7H0ebSjuq407tJyLWIY6YIFnBSaRoNlQHksldgLi08TvT9awzITfbJpCZ
	uShW6sREE5OtxIkUMRKlsCCArUHjWHKZizaGuprYc8dvy0W8lQBbgh62L3zwVjqP
	eM0OyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk330wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 13:29:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2025240a12.0
        for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122148; x=1784726948; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=;
        b=cPBSsth2SQTn2maq/TbeYZEnEuLYQplGpJM21EqslIR6WZKvzUBttxF88BLKgeudIi
         d+pz9EQXwGzvWTQAbzwtGZwi3mg7W+UdaPlfqXdsqMrqfmiQm+QAhIdFSagoBfbUTvsM
         iXoIDE/uRFVyhib1wqz/XDjnK/XioqekR5ycnWPOPK0xSC8OhPKEFEUdlr8XcZ0kqTe2
         IDrSYML5YzJemnOp6hGDvipTYxmEoefotzFRueaHFO5FpJs2OMfPXISSyPpt3Ue7j5hL
         Cru8fRXqI6pA+TIQirkshjC+DAKnNHqBLhK1tkotKE2LR4bA5K524qo6I02Li17y2zbX
         98gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122148; x=1784726948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVHBlxWJeXGJFrYO2asjzSD1IwEuFXzGOnyE3qzwe0Y=;
        b=GCSsWonsWTn0Rncz5x59gVEPAlA9s7BwPCPot2R7lpHkDO96dEmOK6wf5LDnynCMqZ
         RQ7ZsgXnr1drUuOcc5C3aHy3C8KQDsQpwxBqQHTpviiuM+ypdl/ZkgztNBNDfdrZbIi4
         Ya0kDCAhzKE2CNzOrI5RIOd0JzPOF7jYrceRRtg9OS5EwbDq5nfLTkurAEvMT+9z2CiM
         vHKRoGnDo/byKn+/gt3dxA4oGuRYRwbNBerY/72uWLdauzKBMx9EhBd1DSYRIi3okig6
         wQZ32/QinhcxkK+8NSVZeoTyGqa1NJAUWvr00MlxmUBtSIsww4f8uFrF0F3JnTX6sXO8
         owyg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9y44UGqTBNH9IAvYdcru2HMuM3ZYp7EmUgjYccqVkcr6nxu6rBERSqIGPle0Q5HK7hrk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy/OAXDnPLRJ4q4u/KH+6Prf5ixlj+qQ/cb6PeWRWESks9XDVc
	ZBZXLJOdQrTCN4im7L1ERRjYs2tjrdZOOIbTvPNHxIPpeoyIeWRo0aoqAqcWRCSaP4ixCt/72tD
	khVXk37FNiJT+ZtDHeW74O83nfSl0Dq1gmUxL6DmwNAJ+stxSgm4JkJg=
X-Gm-Gg: AfdE7clwkD35+7C2CyxcgWt6KMSC3ZbReTAnDMTVmiUWDXm0wMPHgkU9HUF47yXaO/F
	B+3BIOVnrr/3HYF00NZuAkxqUnopICYH/toc2UTLcPfvJUK+xglkxlJhWDT/wKM/pqt4ESixT4g
	cgSu4E/Nqio6Is1PMOo8Y7W2XIV7i/Zxt8Vt4/k0s1lY/gZSZtV+C0SI0Pq1p75J8LOY8waTmhS
	FJMDB9IakM5JiR3owpIobuGII+4MNQ8M1NpcYPN9ZA3/5uzNAR7oXYZ9qt42bDZbGbZce8cXwNt
	fXDHj9bEGuQGRVNEJxnwioRebtrpwKj0jcg6z5qpPgTf64Gc5d7V7p4xkAdzKhFYpcNbx98ZBc2
	/FpQPqRJStJcHMUQc6xNo+7PYDdjBQeJlDHvjbc4hDRR70g==
X-Received: by 2002:a05:6a20:3944:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3c36c131f83mr2942658637.16.1784122148067;
        Wed, 15 Jul 2026 06:29:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3944:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3c36c131f83mr2942595637.16.1784122147562;
        Wed, 15 Jul 2026 06:29:07 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4365b0dsm2735217c88.15.2026.07.15.06.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:29:07 -0700 (PDT)
Message-ID: <4c52d360-caaa-4c77-b1b3-d6b7e78f7fc7@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:58:54 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
 <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MezSb1hohMsNPR96-hnTr0fjrqZ2ZDKUhwnOWycW3Muzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a578b25 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Tp_YqcUnzpVuw28kZAUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 7a9UigkI-UKiV40U8miu1WZAK54LnCWG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX4uR3z1n+L+Xf
 vmJFpM8NgeqxB/I6zddNUjDeZfVyY/z7C2dx8e2DHN0aeHIaB0J5ID763ZH3iPVrp2G3Uhoooby
 mw4Z84JRDMYr7sXcB6bsb23uPAZPha5SaosoPzHxMgKiS1e8qy6xqTQpVotmINRy0OAGZ9Fk6Mc
 ioD0PfRtMJlBeYX/b7njj2GYUYBAPoUBV3wZhNlrIjyGyuc532HNDVNm+sxOuOeABwKTwX5JxJa
 pyqeVa/AZZEo4RA9vPBNV3cK2EKl5mTxmwqNCRwPCpJ7bpqBXrlsKpZd2w+6ra7nKKtefBTnsSt
 G4DL4mqxf0ZA/pHzL2S1HoZO9zCrTXvBES0yVXWa0wL+/OKRbMPVqskjzvJjxu/EfUMOWZk4vy1
 ZyPQLuUHVNUQhrXw/kj6iAhXq2rHJ/QyET2w0YDh3OxXFtJcS9Z83vQ8U8m2OkyBj/adNp+vD70
 Y8Guqu8DaTFrNwrbu5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX06X/1EserOkX
 O+Wc1nCINVr4aQISmOoUisJsG9qN/8asr5ihZ+kXg1y/fWS/h3HoHo/ocSQtXUNOVliC+rTu0b9
 D7GQhsh3KZ23uybdwjciUdHECKrhDYo=
X-Proofpoint-GUID: 7a9UigkI-UKiV40U8miu1WZAK54LnCWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134



On 15-07-2026 18:44, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:37 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> The PSCI "reboot-mode" node does not define a compatible because it is a
>> configuration of boot-states provided by the underlying firmware. With
>> the new firmware-node based cells in mfd-core, this node can now be
>> exposed as a proper child cell.
>>
>> Add the psci-reboot-mode child cell to the psci-mfd driver with a
>> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
>> reboot-mode failures.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
>>   drivers/power/reset/Kconfig |  2 +-
>>   2 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd..8c6b78ac471b 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>
>>   static const struct mfd_cell psci_cells[] = {
>>   	{
>> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
>>   	},
>>   };
>>
>> +static const struct mfd_cell psci_reboot_mode_cell[] = {
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.named_fwnode = "reboot-mode",
>> +	},
>> +};
>> +
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	struct fwnode_handle *fwnode;
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
>> +	if (!fwnode)
>> +		return 0;
>> +
>> +	fwnode_handle_put(fwnode);
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret)
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
> 
> Why do we have to look up the named node here anyway? Shouldn't MFD core handle
> that already in a generic way?

yes. MFD is handling this. Will remove this explicit check.

thanks,
Shivendra
