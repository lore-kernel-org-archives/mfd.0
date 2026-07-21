Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5352BEFF5
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638144; cv=none; b=COLyf23tMC4GsuUZDZQat6SSvSSZZKUpQVvC2yXnBLHkGQgWbXRa025fkUKPfZ2n5kPe2pHywNwFPEveoGwZXrl/29ELuU/REk44PFCu2Gq9sDVhOZrML3fzeLtpQLm13de5bhkMtQLKLVlFcHW0V5x3Vuf4MT0NeFRwajxamLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638144; c=relaxed/simple;
	bh=U7HA9z1+k46clwJJPu8Z+uz9L279gRK1Zr2lzRLsEz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjjE+DNqqNQOBfnklHyS0XCiayMoHXfnXQc/RCPTN6zXAUMkGvYK6UI6+lfCq+feiCqkyce+SHctB5wrEGHAY1MVyU+aH2wlRiCSFEJFHtq+meMlhmLC78W7RI7gw5tHrVCxEvNvFDNCO2kP9sP6S6Zwl6K+65OLcSDbYvA61z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKBm/+U8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx0OHpaP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKBm/+U8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx0OHpaP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR8DP1134525
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 12:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oR2huL0V5JGejGGvcJlqifpoLwmTifg5Q2IjfL5u2kk=; b=EKBm/+U8PD5Z5AGg
	YzvjnAMBJq1hu3ScDdGMloMvw/terP/e94VjlsGk2RnPibtgn9qkcznlC6POejCd
	5RAIhuHMuTi7+hfh9NgPqxN+BXDmav7h2uEnbFwUeuJ89N/Gx5WHnkU4WrJnwVg0
	Cc9oPiZlTJcYBAOAaKoptZNRIKKlSA8bM/y7EIup1a1S+3AAucu+kSmG5mN1cwFj
	bGtNv/whd0OQvSBZ3lj6fCxGR4p86nmDXcaoOwLC5iblTzVpHoXjytKp4t85mPWz
	7eJjKyY0lxRfa3h8W8JAEoW1IbH2L1VAT1TGgXVNhfgFQdzS3ZImOqtuPS7SYbpk
	xWnjPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as2sk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 12:49:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6ed4fe99so2527440785a.0
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 05:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784638140; x=1785242940; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR2huL0V5JGejGGvcJlqifpoLwmTifg5Q2IjfL5u2kk=;
        b=hx0OHpaPEea7kZrpLA5gb1pfADklWr6Pc36OcmU1NcaAIAA7/AC2J7AYB0VPr9+F9y
         NlcxfcLsr4SlQlDvBeH491QZT0xO0MRDVKddHstqsDt4nmF6x/M/qMMpTYZGWD/hUXKn
         lfgMfkJnkCg0g5PlurgZ1KqA5qDPsBZKwvpCTgst6Uad2T6RSww4vUxEBtqd+zsYoGaF
         s6x0om8nMEGWbqdaMsblYQxZ6cUtqb/iWXlM8si0dWoMEf6lZi6jFxvVhz+xy4ZfK8yi
         +/CUllDH1jJvgKkBlBN5aG4QRp0ljUx/mtqRq8dQK0nWueQSxtctn7CvvIhHr5BOrfrr
         SbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638140; x=1785242940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oR2huL0V5JGejGGvcJlqifpoLwmTifg5Q2IjfL5u2kk=;
        b=L60nIL2gS/cJ80QR1CVaAXyayZ8gF8nFjV2RylReFE0FkP7+5MfC5MPxt+WwMFPJhA
         uIbqj3cF/k0LpbsJ5eK97qT91YaJVUT5Me3vEnX7C911eH+kZldTJGqQGFqW0TwtNutT
         1jtuedbHJiNClY2oZ2qG9aFyd/Skf1YObJFKXExygNTRabeGATqnRw8KCmj2FtpIuQB8
         jV/yJWEVrAM+mAV+cOnCh5DeSOdq5OYuHmfgsb9XbfgbCZiT+nAoL+XZpmAp92gVAkqi
         vYd8MrmNNlFeyKyXVEPB3YTvtN6hk3ntQ6eAPHOLOpUTx9Ilg09GpGrg56sbvE5/Voi0
         cDLg==
X-Forwarded-Encrypted: i=1; AHgh+RoqmMILdrqd3qtzHtmHTU4sHMb/XFIPBYnFR9rroTIBk7xuKqACgb4fTdHr0ok6VHhn93Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Cm/+I5V4ux/ivhrGs/f/i9bNx7MIL1aSUtBa05Kp3oP1/0HO
	wkf6PU8erM2aasHB/mzqxUDXyCgY7CuZr8qyjxTHeUDPuCJWFvet0PEBjbgfNa4cOD+d522Mqpk
	nS67rkrRfI1Ka7EParJBKuhlw2c3w9IqtQ5YC7ajDXNTxhAp3uK/aiGQ=
X-Gm-Gg: AfdE7cm16ays7/6Qnd5QKMqDkylp3ic0smtUJETwD4PIyCR8CY/IOg8OWGiICu/2bXF
	ebHK7B6/nJBHonT73y5SoE+hHOQDo0oCsH0HGB92PPxf57aiFwZ0YoX+Od5KLxQVgtS0up7/3Qz
	3CQAvXZTZSWeEii1vYozmZAF3n9jg8kzHEO8K9zs9RSt0cQMask2VvJrBJMTzFERPkakRrm5v0Y
	aJSUmZR1wvgNkmKYd2+dVTDrOT6jb/xGOn7zamYh4JCU/gYoVxvof7IMdcJ2nrJiEkYuOakItzQ
	3Lv+fJIoa6cT2BlBdbuPccShvRloVlLW5HLy6rZe+qSSFUaR2pcTPJDUDmtkcnPt0xj0pUBTPMu
	p7KjjyzHR3f5aXhqLCuUpVVUCN/PFbKd4mbM=
X-Received: by 2002:a05:620a:230f:20b0:92b:6805:91b4 with SMTP id af79cd13be357-930b431ca0emr1359563385a.60.1784638140238;
        Tue, 21 Jul 2026 05:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:230f:20b0:92b:6805:91b4 with SMTP id af79cd13be357-930b431ca0emr1359556785a.60.1784638139417;
        Tue, 21 Jul 2026 05:48:59 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52fb150sm1113767785a.19.2026.07.21.05.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:48:58 -0700 (PDT)
Message-ID: <c7f5d4cf-07ee-4716-bb8d-83bcd0b2f8d0@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 18:18:46 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD
 cells
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
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
 <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfXy9TWj6NwCWxB
 RhiWbOVdJemGOaJiAHUBzWxQA0g54Mji9k4OzbvjIPDHAE+iQH7vUSCim8XSTUgzO30qPaFZemT
 06eCYsCCV0CYgkarG1kyQ+KHrX9tDSLms7zSJI/5tRaXULRNnbp+8P5sgsT6idJ3xGV+m4fNp7a
 +Z0yRhCgs8hxcsvJ/6OhPhaepH89VGOB5fw6nI2x+/Y6pa5AXI7aNEIBVs4w8n64leDGX2M8O2Q
 2jCP0RrqrSdSRxPp96sxQ2D1HfoxkJDVCjAtVq6eF8C9WRWTDFLcn3AF2sxrxC2w4d2P/s4OFJe
 ZoDxZtQfT95oTvbQ4QX7xpO/Qp4wMnt0p5LZjz19ucnThuqMBSO7M5wsUjUQBaltjBiZyher+Ve
 Imud5ZbQ95bfCVutdaA1UmfclgbOBpA+GSfGhcpeLCSt7dq+GwjuXN9+qm+BOZwCnxtvVBsH8yF
 p1Uh+HzCM36FHChINwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNSBTYWx0ZWRfX4eK/2zRZYDic
 IzVAESZUpZhavEsZ9LhQXYzY6J46p//+ocG2pAnYJdpVuNPUJxg7daQb7sSUobUW1HFUmtRaaqk
 ShVn+LgWzFU54fKphhqkqZd2A9eLWi8=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f6abd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EQpnHehRo6XFvJL-JpUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: I7KTmS8ky6biORR8aKVOSRsR9_4-pHLt
X-Proofpoint-ORIG-GUID: I7KTmS8ky6biORR8aKVOSRsR9_4-pHLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210135



On 21-07-2026 14:59, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:36 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> MFD core has no way to register a child device using an explicit firmware
>> node. This prevents drivers from registering child nodes when those nodes
>> do not define a compatible string. One such example is the PSCI
>> "reboot-mode" node, which omits a compatible string as it describes
>> boot-states provided by the underlying firmware.
>>
>> Extend struct mfd_cell with a named firmware-node field to identify a
>> child node under the MFD parent. The node is added to the MFD child
>> device during registration when none is assigned by device tree, ACPI,
>> or software matching.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/mfd/mfd-core.c   | 142 ++++++++++++++++++++++++++++++++++++++++-------
>>   include/linux/mfd/core.h |  10 ++++
>>   2 files changed, 131 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
>> index 7aa32b90cf1e..ba9682ead2ca 100644
>> --- a/drivers/mfd/mfd-core.c
>> +++ b/drivers/mfd/mfd-core.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/acpi.h>
>> +#include <linux/fwnode.h>
>>   #include <linux/list.h>
>>   #include <linux/property.h>
>>   #include <linux/mfd/core.h>
>> @@ -22,6 +23,7 @@
>>   #include <linux/regulator/consumer.h>
>>
>>   static LIST_HEAD(mfd_of_node_list);
>> +static LIST_HEAD(mfd_named_fwnode_list);
>>   static DEFINE_MUTEX(mfd_of_node_mutex);
>>
>>   struct mfd_of_node_entry {
>> @@ -30,10 +32,91 @@ struct mfd_of_node_entry {
>>   	struct device_node *np;
>>   };
>>
>> +struct mfd_named_fwnode_entry {
>> +	struct list_head list;
>> +	struct device *dev;
>> +	struct fwnode_handle *fwnode;
>> +};
>> +
>>   static const struct device_type mfd_dev_type = {
>>   	.name	= "mfd_device",
>>   };
>>
>> +static int mfd_claim_named_fwnode(struct platform_device *pdev,
>> +				  struct fwnode_handle *fwnode)
>> +{
>> +	struct mfd_named_fwnode_entry *entry, *iter;
>> +
>> +	entry = kzalloc_obj(*entry, GFP_KERNEL);
>> +	if (!entry)
>> +		return -ENOMEM;
>> +
>> +	entry->dev = &pdev->dev;
>> +	entry->fwnode = fwnode_handle_get(fwnode);
>> +
>> +	scoped_guard(mutex, &mfd_of_node_mutex) {
>> +		list_for_each_entry(iter, &mfd_named_fwnode_list, list)
>> +			if (iter->fwnode == fwnode) {
>> +				fwnode_handle_put(entry->fwnode);
>> +				kfree(entry);
>> +				return -EAGAIN;
>> +			}
>> +
>> +		list_add_tail(&entry->list, &mfd_named_fwnode_list);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Temporary MFD-local cleanup for named non-OF child fwnodes.
>> + * Remove/rework this when platform core starts owning and dropping
>> + * dev->fwnode references for these devices.
>> + */
>> +static void mfd_release_named_fwnode(struct platform_device *pdev)
>> +{
>> +	struct mfd_named_fwnode_entry *entry, *tmp;
>> +
>> +	scoped_guard(mutex, &mfd_of_node_mutex) {
>> +		list_for_each_entry_safe(entry, tmp, &mfd_named_fwnode_list, list)
>> +			if (entry->dev == &pdev->dev) {
>> +				if (dev_fwnode(&pdev->dev) == entry->fwnode)
>> +					device_set_node(&pdev->dev, NULL);
>> +				fwnode_handle_put(entry->fwnode);
>> +				list_del(&entry->list);
>> +				kfree(entry);
>> +			}
>> +	}
>> +}
>> +
>> +static int mfd_claim_of_node_to_dev(struct platform_device *pdev,
>> +				    struct device_node *np)
>> +{
>> +	struct mfd_of_node_entry *of_entry, *iter;
>> +
>> +	of_entry = kzalloc_obj(*of_entry, GFP_KERNEL);
>> +	if (!of_entry)
>> +		return -ENOMEM;
>> +
>> +	of_entry->dev = &pdev->dev;
>> +	of_entry->np = of_node_get(np);
>> +
>> +	/* Skip if OF node has previously been allocated to a device */
>> +	scoped_guard(mutex, &mfd_of_node_mutex) {
>> +		list_for_each_entry(iter, &mfd_of_node_list, list)
>> +			if (iter->np == np) {
>> +				of_node_put(of_entry->np);
>> +				kfree(of_entry);
>> +				return -EAGAIN;
>> +			}
>> +
>> +		list_add_tail(&of_entry->list, &mfd_of_node_list);
>> +	}
>> +
>> +	device_set_node(&pdev->dev, of_fwnode_handle(np));
>> +	return 0;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_ACPI)
>>   struct match_ids_walk_data {
>>   	struct acpi_device_id *ids;
>> @@ -111,19 +194,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>>   				    struct device_node *np,
>>   				    const struct mfd_cell *cell)
>>   {
>> -	struct mfd_of_node_entry *of_entry;
>>   	u64 of_node_addr;
>>
>> -	/* Skip if OF node has previously been allocated to a device */
>> -	scoped_guard(mutex, &mfd_of_node_mutex) {
>> -		list_for_each_entry(of_entry, &mfd_of_node_list, list)
>> -			if (of_entry->np == np)
>> -				return -EAGAIN;
>> -	}
>> -
>>   	if (!cell->use_of_reg)
>>   		/* No of_reg defined - allocate first free compatible match */
>> -		goto allocate_of_node;
>> +		return mfd_claim_of_node_to_dev(pdev, np);
>>
>>   	/* We only care about each node's first defined address */
>>   	if (of_property_read_reg(np, 0, &of_node_addr, NULL))
>> @@ -134,18 +209,7 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>>   		/* No match */
>>   		return -EAGAIN;
>>
>> -allocate_of_node:
>> -	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
>> -	if (!of_entry)
>> -		return -ENOMEM;
>> -
>> -	of_entry->dev = &pdev->dev;
>> -	of_entry->np = of_node_get(np);
>> -	scoped_guard(mutex, &mfd_of_node_mutex)
>> -		list_add_tail(&of_entry->list, &mfd_of_node_list);
>> -
>> -	device_set_node(&pdev->dev, of_fwnode_handle(np));
>> -	return 0;
>> +	return mfd_claim_of_node_to_dev(pdev, np);
>>   }
>>
>>   static int mfd_add_device(struct device *parent, int id,
>> @@ -156,6 +220,7 @@ static int mfd_add_device(struct device *parent, int id,
>>   	struct resource *res;
>>   	struct platform_device *pdev;
>>   	struct mfd_of_node_entry *of_entry, *tmp;
>> +	struct fwnode_handle *fwnode;
>>   	bool disabled = false;
>>   	int ret = -ENOMEM;
>>   	int platform_id;
>> @@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
>>
>>   	mfd_acpi_add_device(cell, pdev);
>>
>> +	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
>> +	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {
> 
> Use dev_fwnode() instead of pdev->dev.fwnode.

sure will update. thanks.

> 
>> +		struct device_node *named_np;
>> +
>> +		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
>> +		if (!fwnode) {
>> +			ret = -ENODEV;
>> +			goto fail_alias;
>> +		}
>> +
>> +		named_np = to_of_node(fwnode);
>> +		if (named_np) {
>> +			ret = mfd_claim_of_node_to_dev(pdev, named_np);
>> +			fwnode_handle_put(fwnode);
>> +			if (ret == -EAGAIN)
>> +				ret = -EBUSY;
>> +			if (ret)
>> +				goto fail_alias;
>> +		} else {
>> +			ret = mfd_claim_named_fwnode(pdev, fwnode);
>> +			if (ret) {
>> +				fwnode_handle_put(fwnode);
>> +				if (ret == -EAGAIN)
>> +					ret = -EBUSY;
>> +				goto fail_alias;
>> +			}
>> +			device_set_node(&pdev->dev, fwnode);
>> +			fwnode_handle_put(fwnode);
>> +		}
> 
> What is the reason to have this split into OF and fwnode functions? I don't
> really see why you would need to do it twice, isn't fwnode sufficient for the
> OF node case too?

We do a duplicate check here before adding the named_fwnode and split it 
for two reasons:
1. of_node list pre-exists. We add a new list of fwnode. of_node based 
duplicate check go wrong, if its checked with the fwnode list.
2. of_node need to go to its respective list as fwnode list, release 
path, is different for us.

> 
>> +	}
>> +
>>   	if (cell->pdata_size) {
>>   		ret = platform_device_add_data(pdev,
>>   					cell->platform_data, cell->pdata_size);
>> @@ -295,6 +391,7 @@ static int mfd_add_device(struct device *parent, int id,
>>   	if (cell->swnode)
>>   		device_remove_software_node(&pdev->dev);
>>   fail_of_entry:
>> +	mfd_release_named_fwnode(pdev);
>>   	scoped_guard(mutex, &mfd_of_node_mutex) {
>>   		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
>>   			if (of_entry->dev == &pdev->dev) {
>> @@ -382,7 +479,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
>>   	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
>>   					       cell->num_parent_supplies);
>>
>> +	get_device(&pdev->dev);
>>   	platform_device_unregister(pdev);
>> +	mfd_release_named_fwnode(pdev);
>> +	put_device(&pdev->dev);
>>   	return 0;
>>   }
>>
>> diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
>> index faeea7abd688..8daa83dd31ea 100644
>> --- a/include/linux/mfd/core.h
>> +++ b/include/linux/mfd/core.h
>> @@ -80,6 +80,16 @@ struct mfd_cell {
>>
>>   	/* Software node for the device. */
>>   	const struct software_node *swnode;
>> +	/*
>> +	 * Name of a child firmware node under the MFD parent device.
>> +	 *
>> +	 * Used only as a fallback when no firmware node is assigned to MFD
>> +	 * child and no software node is provided.
>> +	 *
>> +	 * For Device Tree parents, lookup is by base node name only
>> +	 * (the part before '@'). Unit-addresses are not matched.
>> +	 */
> 
> Side note: struct mfd_cell could really use a proper kernel doc but that's out
> of scope of this series.
> 
>> +	const char *named_fwnode;
>>
>>   	/*
>>   	 * Device Tree compatible string
>>
>> --
>> 2.34.1
>>
>>
> 
> Bartosz

thanks,
Shivendra
